datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
time = [dataset{:,2}];
keyboard;
j = 1;
i = 2;
agrupamento = zeros(1,length(time));
agrupamento(1) = 1;
agrupador = 1;
while j < length(time)
time1 = time(j);

while i < length(time)
    timeatual = time(i);
    if(timeatual - time1 > 1 )
        agrupador = agrupador + 1;
        agrupamento(i) = agrupador;
        j = j + agrupador;
        i = j + 1;
        break;
%         keyboard;
    else
        agrupamento(i) = agrupador;
        i = i + 1;
    end
end
end