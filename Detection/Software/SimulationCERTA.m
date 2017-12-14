clear all;
close all;
clc;
%To use the simulator, first unzip and rename to finaldataset.arff file
% in RTDDoS/matlabArff folder
% After, execute getDatasetScript to generate the dataset.mat file
tic;
% Enable Debug mode
debug = 0;
% DestIP = 3;
% windownSize = 5;
threshold = 0.6:0.01:0.95;
% [PktRate VarSourceIP EntropySourceIP]
normalTraffic1 = [305.644 0.808 3.1 ];
normalTraffic2 = [357663 12.7 0.94 ];
% getting dataset Mtx
% datasetMtx = getDatasetScript();
load('dataset.mat');
% Mtx filtering by destination IP
% idxDestIP = find(datasetMtx(:,2) == DestIP);
% Filtered Mtx
% datasetMtx = datasetMtx(idxDestIP,:);
% keyboard;
% step to divide window time
step = 1;
time = 0;
win = 0;
ataques = zeros(1,length(threshold));
normal = zeros(1,length(threshold));
result = zeros(1,length(threshold));
% keyboard;
for idx = 1:length(threshold)
for i = 1:length(datasetMtx(:,1))
    %     Getting send time of pkt
    pktSendTIME = datasetMtx(i,24);
    pktDelayNODE = datasetMtx(i,18);
    pktDELAY = datasetMtx(i,23);
    pktReservedTIME = datasetMtx(i,25);
    %     time is the sum of all delays
    time = time + pktSendTIME + pktDelayNODE + pktDELAY + pktReservedTIME;
    %     time is the sum of all delays
    time = time + pktSendTIME + pktDelayNODE + pktDELAY + pktReservedTIME;
    %
    if time >= 1000
%         keyboard;
        win = win + 1;
        trafficPktRate = mean(datasetMtx(step:i,19));
        sourceIPs = datasetMtx(step:i,1);
        %         VarSourceIPs = 0;
        aux = 0;
        for j = 1:(length(sourceIPs) - 1)
            if sourceIPs(j) ~= sourceIPs(j+1)
                aux = aux + 1;
            end
        end
        if debug == 1
            trafficPktRate(win,1) = mean(datasetMtx(step:i,19));
            VarSourceIPs(win,1) = aux/length(sourceIPs);
            entropySourceIPs(win,1) = entropy(sourceIPs);
%             keyboard;
            NaHidModule(win,1) = NaHid([trafficPktRate(win,1) VarSourceIPs(win,1) entropySourceIPs(win,1)],normalTraffic1);
            NaHiDResults(win,1) = NaHidModule(win,1);
            if(NaHidModule(win,1) < 0.81)
                disp('traffic');
                disp(i);
                disp('atack');
            else
                disp('traffic');
                disp(i);
                disp('normal');
                
            end
            step =  i + 1;
            time = 0;
            
        else
            VarSourceIPs = aux/length(sourceIPs);
            entropySourceIPs = entropy(sourceIPs);
            NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
            NaHiDResults(1,win) = NaHidModule;
            
            if(NaHidModule > threshold(1,idx))
%                 disp('traffic');
%                 disp(i);
%                 disp('atack');
%                 keyboard
                ataques(1,idx) = ataques(1,idx) + 1;
                normalTraffic1 = [trafficPktRate VarSourceIPs entropySourceIPs];
            else
%                 disp('traffic');
%                 disp(i);
%                 disp('normal');
%                 keyboard
                normal(1,idx) = normal(1,idx) + 1;
            end
            step =  i + 1;
            time = 0;
        end
    end
    
end

% step = 1;
% for i = 1:length(idxDestIP)
%
%     trafficPktRate = mean(datasetMtx(step:windownSize,19));
%     sourceIPs = datasetMtx(step:windownSize,1);
%     %     VarSourceIPs =
%     entropySourceIPs = entropy(sourceIPs);
%     NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
%     if(NaHidModule < 0.81)
%         disp('atack');
%     else
%         disp('normal');
%         step = step + windownSize;
%     end
% end
result(1,idx) = 1 -(normal(1,idx)/(ataques(1,idx) + normal(1,idx)) );
% plot(x,y,'blue--o');
% xlabel('Threshould');
% ylabel('Accuracy');
% title('NaHid');
end
toc;