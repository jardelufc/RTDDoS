% Destination IP
% DestIP = '192.168.0.20';
keyboard;
% Reading table from wireshark
datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
% Removing some cells 
% dataset = datasetTable{:,:};
% initial normal traffic
% keyboard;
normalTraffic1 = [3120 0.1667 0];
% Filtering datasetMtx by destination IP
% idxDestIP =  find(strcmp(dataset(:,4), DestIP));
% dataset = dataset(idxDestIP,:);
% Getting variables by filtered mtx and converting 
packetID = [dataset{:,1}];
time = [dataset{:,2}];

% keyboard;
packetSize = [dataset{:,6}];
% Variables initialization
numOfPackets = zeros(1,length(dataset(:,1)));
packetRateBps = zeros(1,length(dataset(:,1)));
aux = 1;
difer = 0;
i = 1;
winPacket = 0;
ataques = 0;
normal = 0;
% keyboard;
% Getting packet size in bps 
for k= 1:length(dataset(:,1))
    packetRateBps(k) = packetSize(k) * 8; 
end
% keyboard;
t = 1;
while i < length(dataset(:,1))
    keyboard;
 t = max(find(cumsum(time(t:end))<=1));
end
while i < length(dataset(:,1))
    
    
    
    
    numOfPackets(i) = j - i;
    sourceIPs = dataset(i:(i+winPacket-1),3);

    VarSourceIPs = aux/length(sourceIPs);
    entropySourceIPs = entropy(sourceIPs);
    trafficPktRate = sum(packetRateBps(i:(i+winPacket-1)));
    NaHidModule = NaHid([trafficPktRate VarSourceIPs entropySourceIPs],normalTraffic1);
    if(NaHidModule < 0.81)
        disp('traffic');
        disp(i);
        disp('atack');
        ataques = ataques + 1;
        keyboard;
    else
        disp('traffic');
        disp(i);
        disp('normal');
        normalTraffic1 = [trafficPktRate VarSourceIPs entropySourceIPs];
        normal = normal + 1;

    end
    i =  i + winPacket;
    winPacket = 0;
    
    
end
