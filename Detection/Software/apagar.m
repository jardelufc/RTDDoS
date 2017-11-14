datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
time = [dataset{:,2}];
% coisa1 = 0;
% coisa2 = 0;
% idxInicioJanela = 0;
% for i = 1:length(time)-1
%     coisa1 = time(i);
%     coisa2 = time(i+1);
%     dif = coisa1 - coisa1;
%     if(dif >= 1)
%         vector
%         disp(i)
%         keyboard;
%
%     else
%         idxInicioJanela = idxInicioJanela + 1;
%     end
% end
% % mago
% time1 = time(1);
% agrupamento = zeros(1,length(time));
% agrupamento(1) = 1;
% agrupador = 1;
%
% for i = 2:length(time)
%     if(time(i) - time1 > 1 )
%         agrupador = agrupador + 1;
%         agrupamento(i) = agrupador;
% %         keyboard;
%     else
%         agrupamento(i) = agrupador;
%     end
% end
% % keyboard;
% agrupamento = zeros(1,length(time));
% agrupamento(1) = 1;
% agrupador = 1;
% j = 1;
% i = 2;
% while( j < length(time))
%     time1 = time(j);
%     while i < length(time)
%         if(time(i) - time1 > 1 )
%             agrupador = agrupador + 1;
%             agrupamento(i) = agrupador;
%             j = agrupador + j;
%             i = j + 1;
%             keyboard
%             break;
%
%         else
%             agrupamento(i) = agrupador;
%             i = i + 1;
%         end
%             i = i +1;
%     end
% end
%
% for i = 1:agrupamento:length(time)
%     time1 = time(i);
%
%     while i < length(time)
%         if(time(i) - time1 > 1 )
%             agrupador = agrupador + 1;
%             agrupamento(i) = agrupador;
%             j = agrupador + j;
%             i = j + 1;
% %             keyboard
%             break;
%
%         else
%             agrupamento(i) = agrupador;
%             i = i + 1;
%         end
%         %     i = i +1;
%     end
%
% end
agrupamento(1) = 1;
agrupador = 1;
vtr = zeros(1,length(time));
auxVtr = zeros(1,length(time));
x = 0;
i = 1;
% j = 2;
    while(i<length(time) - 1)
        auxVtr(i) =  time(i + 1) - time(i);
        i = i + 1;        
    end
    
    for j = 1:length(auxVtr)-1
        value = (auxVtr(j) + auxVtr(j+1));
        if(value > 1)
            
        end
    end





