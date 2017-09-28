% Destination IP
DestIP = '172.16.112.194';
% Reading table from wireshark
datasetTable = readtable('teste.csv');
% Removing some cells 
dataset = datasetTable{:,:};
% initial normal traffic
normalTraffic1 = [345574 12.98 0.94 ];
% Filtering datasetMtx by destination IP
idxDestIP =  find(strcmp(dataset(:,4), DestIP));
datasetMtxDestIP = dataset(idxDestIP,:);
% Getting variables by filtered mtx and converting 
packetID = datasetMtxDestIP(:,1);
packetID = str2double(packetID);
time = str2double(datasetMtxDestIP(:,2));
packetSize = datasetMtxDestIP(:,6);
packetSize = str2double(packetSize);
% Variables initialization
numOfPackets = zeros(1,length(idxDestIP));
packetRateBps = zeros(1,length(idxDestIP));
aux = 1;
difer = 0;
i = 1;
winPacket = 0;
% Getting packet size in bps 
for k= 1:length(idxDestIP)
    packetRateBps(k) = packetSize(k) * 8; 
end
% 
while i < (length(idxDestIP)-1)
    j = i + 1;
    while true
        difer = time(j) - time(i);
        winPacket = j - i;
        if difer > 1 || j == (length(idxDestIP)-1)
            break;
        else
            j = j + 1;
        end
    end
    numOfPackets(i) = j - i;
    sourceIPs = datasetMtxDestIP(i:(i+winPacket-1),3);
%     if length(sourceIPs)~=numOfPackets
%         keyboard;
%     end
    VarSourceIPs = aux/length(sourceIPs);
    entropySourceIPs = entropy(sourceIPs);
    trafficPktRate = sum(packetRateBps(i:(i+winPacket-1)));
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
    end
    i =  i + winPacket;
    winPacket = 0;
    
    
end
