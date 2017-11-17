datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
time = [dataset{:,2}];
diferencas = zeros(1,length(time));
j = 2;
for i = 1:length(time)
    valor = time(i);
    % keyboard;
    while j < length(time)
        valor2 = time(j);
        diferenca = valor2 - valor;
        diferencas(j) = diferenca;
        j = j+1;
        if diferenca > 1
            break;
        end
    end
    
end

keyboard;
t = 1;
while t < length(diferencas)
    coisa = diferencas(t);
    u = t +1;
    while u < length(diferencas)-1
        coisa2 = diferencas(u);
        if(coisa + coisa2 ) >1
            index1 = t;
            index2 = u -1;
            t = t +1;
            keyboard;
            break;
        else
            u = u +1;
        end
    end
end