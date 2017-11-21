datasetTable = readtable('testeval.csv');
dataset = table2cell(datasetTable);
time = [dataset{:,2}];
janela = time(1);
janelas = zeros(1,length(time));
janelas(1) = 1;
i = 1;
j = 2;
contador = 1;
% keyboard;
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
end
