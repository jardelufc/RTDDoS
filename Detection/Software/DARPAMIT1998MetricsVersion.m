% Destination IP
DestIP = '192.168.0.20';
% Reading table from wireshark
datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
threshold = [0.7 0.75 0.8 0.85 0.9 ];
% initial normal traffic
normalTraffic1 = [3120 0.1667 0];
% Filtering datasetMtx by destination IP
idxDestIP =  find(strcmp(dataset(:,4), DestIP));
datasetMtxDestIP = dataset(idxDestIP,:);
% Getting variables by filtered mtx and converting
packetID = [datasetMtxDestIP{:,1}];
time = [datasetMtxDestIP{:,2}];
packetSize = [datasetMtxDestIP{:,6}];
% Variables initialization
numOfPackets = zeros(1,length(idxDestIP));
packetRateBps = zeros(1,length(idxDestIP));
results = zeros(1,length(threshold));
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
    keyboard
    VarSourceIPs(i,1) = aux/length(sourceIPs);
    entropySourceIPs(i,1) = entropy(sourceIPs);
    trafficPktRate(i,1) = sum(packetRateBps(i:(i+winPacket-1)));
    NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
    
    for j= 1:length(threshold)
        if(NaHidModule < threshold(j))
            disp('traffic');
            disp(i);
            disp('atack');
            result(1,j) = 'atack';
        else
            disp('traffic');
            disp(i);
            disp('normal');
            result(1,j) = 'normal traffic';
            normalTraffic1 = [trafficPktRate VarSourceIPs entropySourceIPs];
            
        end
    end
    i =  i + winPacket;
    winPacket = 0;
    
    
end
