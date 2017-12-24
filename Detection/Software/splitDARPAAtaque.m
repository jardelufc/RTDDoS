datasetTable = readtable('normaltretaNT2000.csv');
keyboard;
datasetTable = table2cell(datasetTable);
packetID = datasetTable(:,1);
timeCell = datasetTable(:,2);
packetSize = datasetTable(:,6);
numOfPackets = zeros(1,length(packetID));
packetRateBps = zeros(1,length(packetID));
time = zeros(1,length(packetID));
sourceIPs = datasetTable(:,3);
% normalTraffic = [688 0.5 1];
normalTraffic = [848 0.5 1];
% numeroataques = 0;
% numeronormal = 0;
threshold = 0.64:0.02:0.95;
ataques = zeros(1,length(threshold));
normal = zeros(1,length(threshold));
numeroataques = zeros(1,length(threshold));
numeronormal = zeros(1,length(threshold));
% keyboard;
for idxTH = 1:length(threshold)
    % Getting packet size in bps
    for k= 1:length(packetID)
        packetRateBps(k) = str2num(packetSize{k}) * 8;
        time(k) = str2num(timeCell{k});
    end
    % keyboard;
    janela = time(1);
    % conjunto de janelas de tempo
    janelas = zeros(1,length(time));
    janelas(1) = 1;
    i = 1;
    j = 2;
    contador = 1;
    % keyboard;
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
    % keyboard;
    janelas(length(time)) = janelas(length(time) - 1);
%     aux = 1;
    for idx = 1:janelas(length(time))
            aux = 0;

        win = find(janelas == idx);
        IPsOrigemWin = sourceIPs(win);
        packetRate = mean(packetRateBps(win));
        %     keyboard
        if win(1) == 1308
        keyboard;
        end
        for indices = 1:(length(IPsOrigemWin) - 1)
            if ~strcmp(IPsOrigemWin(indices + 1),IPsOrigemWin(indices))
%                 keyboard;
                aux = aux + 1;
            end
        end
        
        
        
        VarSourceIPs = aux/length(IPsOrigemWin);
        entropySourceIPs = entropy(IPsOrigemWin);
        NaHidModule = NaHid([packetRate VarSourceIPs entropySourceIPs],normalTraffic);
        %     keyboard;
        if isnan(NaHidModule)
            keyboard;
        end
        
        if(NaHidModule <  threshold(1,idxTH))
            disp('traffic');
            disp(idx);
            disp('atack');
            numeroataques(1,idxTH) = numeroataques(1,idxTH) + 1;
            ataques(1,idxTH) = 1;
            
%                      keyboard;
        else
            disp('traffic');
            disp(idx);
            disp('normal');
%                                 keyboard;

            normalTraffic = [packetRate VarSourceIPs entropySourceIPs];
            numeronormal(1,idxTH) = numeronormal(1,idxTH) + 1;
            normal(1,idxTH) = 1;
            
            
            
        end
    end
%     result(1,idxTH) = 1 -(normal(1,idxTH)/(ataques(1,idxTH) + normal(1,idxTH)) );
end
