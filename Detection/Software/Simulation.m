<<<<<<< HEAD
% Enable Debug mode
debug = 1;
DestIP = 24;
=======
DestIP = 3;
>>>>>>> 945c18613071dfe0fbd79c591b81f903cbcd4d40
% windownSize = 5;
threshold = 0.81;
% [PktRate VarSourceIP EntropySourceIP]
normalTraffic1 = [345574 12.98 0.94 ];
normalTraffic2 = [357663 12.7 0.94 ];
% getting dataset Mtx
% datasetMtx = getDatasetScript();
load('dataset.mat');
% Mtx filtering by destination IP
idxDestIP = find(datasetMtx(:,2) == DestIP);
% Filtered Mtx
datasetMtxDestIP = datasetMtx(idxDestIP,:);
% keyboard;
% step to divide window time
step = 1;
time = 0;
<<<<<<< HEAD
win = 0;
% keyboard;
for i = 1:length(idxDestIP)
    %     Getting send time of pkt
=======
for i = 1:length(idxDestIP)
%     Getting send time of pkt
>>>>>>> 945c18613071dfe0fbd79c591b81f903cbcd4d40
    pktSendTIME = datasetMtxDestIP(i,24);
    pktDelayNODE = datasetMtxDestIP(i,18);
    pktDELAY = datasetMtxDestIP(i,23);
    pktReservedTIME = datasetMtxDestIP(i,25);
<<<<<<< HEAD
    %     time is the sum of all delays
    time = time + pktSendTIME + pktDelayNODE + pktDELAY + pktReservedTIME;
    %
    if time >= 1000
        %         keyboard
        win = win + 1;
=======
%     time is the sum of all delays
    time = time + pktSendTIME + pktDelayNODE + pktDELAY + pktReservedTIME;
%     
    if time >= 1000
>>>>>>> 945c18613071dfe0fbd79c591b81f903cbcd4d40
        trafficPktRate = mean(datasetMtxDestIP(step:i,19));
        sourceIPs = datasetMtxDestIP(step:i,1);
        %         VarSourceIPs = 0;
        aux = 0;
        for j = 1:(length(sourceIPs) - 1)
            if sourceIPs(j) ~= sourceIPs(j+1)
                aux = aux + 1;
            end
        end
<<<<<<< HEAD
        
        if debug == 1
            trafficPktRate(win,1) = mean(datasetMtxDestIP(step:i,19));
            VarSourceIPs(win,1) = aux/length(sourceIPs);
            entropySourceIPs(win,1) = entropy(sourceIPs);
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
                keyboard
            end
            step =  i + 1;
            time = 0;
            
        else
            VarSourceIPs = aux/length(sourceIPs);
            entropySourceIPs = entropy(sourceIPs);
            NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
            NaHiDResults(1,win) = NaHidModule;
            
            if(NaHidModule < 0.81)
                disp('traffic');
                disp(i);
                disp('atack');
            else
                disp('traffic');
                disp(i);
                disp('normal');
                keyboard
            end
            step =  i + 1;
            time = 0;
        end
    end
    
end
=======
        VarSourceIPs = aux/length(sourceIPs);
        entropySourceIPs = entropy(sourceIPs);
        NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
        if(NaHidModule < 0.81)
            disp('traffic');
            disp(i);
            disp('atack');
        else
            disp('traffic');
            disp(i);
            disp('normal');
            keyboard
            step = step + i;
        end
        time = 0;
    end
    
end

% step = 1;
% for i = 1:length(idxDestIP)
%
%     trafficPktRate = mean(datasetMtxDestIP(step:windownSize,19));
%     sourceIPs = datasetMtxDestIP(step:windownSize,1);
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
>>>>>>> 945c18613071dfe0fbd79c591b81f903cbcd4d40
