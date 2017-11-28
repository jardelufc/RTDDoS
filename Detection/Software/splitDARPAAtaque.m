datasetTable = readtable('ataque.csv');
datasetTable = table2cell(datasetTable);
packetID = datasetTable(:,1);
timeCell = datasetTable(:,2);
packetSize = datasetTable(:,6);
numOfPackets = zeros(1,length(packetID));
packetRateBps = zeros(1,length(packetID));
time = zeros(1,length(packetID));
sourceIPs = datasetTable(:,3);
normalTraffic = [688 0.5 1];
numeroataques = 0;
numeronormal = 0;
keyboard;

% Getting packet size in bps
for k= 1:length(packetID)
    packetRateBps(k) = str2num(packetSize{k}) * 8;
    time(k) = str2num(timeCell{k});
end

janela = time(1);
% conjunto de janelas de tempo
janelas = zeros(1,length(time));
janelas(1) = 1;
i = 1;
j = 2;
contador = 1;
keyboard;
% organizando as janelas de tempo
while i < length(time)
    valor1 = time(i);
    primeirojanela = time(i);
    while j < length(time)
        valor = time(j);
        result = valor - primeirojanela;
        if(result <= 1.0000)
            janelas(j) = contador;
            j = j + 1;
        else
            contador = contador + 1;
            janelas(j) = contador;
            i = j;
            j = j + 1;
            break;
        end
    end   
    if j == length(time)
        break;
    end
end
keyboard;
janelas(length(time)) = 5;
aux = 1;
for idx = 1:5
%     if idx == 19
%         keyboard;
%     end
    win = find(janelas == idx);
    IPsOrigemWin = sourceIPs(win);
    packetRate = mean(packetRateBps(win));
%     keyboard
    for indices = 1:(length(IPsOrigemWin) - 1)
        if strcmp(IPsOrigemWin(indices + 1),IPsOrigemWin(indices))
            aux = aux + 1;
        end
    end
    
    VarSourceIPs = aux/length(IPsOrigemWin);
    entropySourceIPs = entropy(IPsOrigemWin);
    NaHidModule = NaHid([packetRate VarSourceIPs entropySourceIPs],normalTraffic);
    
    if isnan(NaHidModule)
        keyboard;
    end
    
    if(NaHidModule < 0.81)
        disp('traffic');
        disp(idx);
        disp('atack');
        numeroataques = numeroataques + 1;
        keyboard;
    else
        disp('traffic');
        disp(idx);
        disp('normal');
        normalTraffic = [packetRate VarSourceIPs entropySourceIPs];
        numeronormal = numeronormal + 1;
%         keyboard;
        
        
    end
end


