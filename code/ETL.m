
function []= ETL(tipo)
    a=0.1;
    b=0.99;
    
    if tipo==1
        filename = '20 Percent Training Set.csv';
    else
        filename = 'KDDTest+.csv';
    end
    table = readtable(filename,'Delimiter',',','ReadVariableNames',false);

    target(strcmp(table{:,42},'normal'))=1;
    target(~strcmp(table{:,42},'normal'))=-1;
    target=target';

    caracteristicas=table2cell(table);

    retorno=numeros(table{:,2});
    retorno2=numeros(table{:,3});
    retorno3=numeros(table{:,4});

    final=[cell2mat(caracteristicas(:,1)) retorno retorno2 retorno3 cell2mat(caracteristicas(:,5:41))];

    juntos=[final target];
    [ordenados, index]=sortrows(juntos,42);

    ataque=sum(juntos(:,42)==-1);

    ataques=ordenados((1:ataque),:);
    normales=ordenados((ataque+1:end),:);

    menorCantidad=min(length(ataques),length(normales));

    ataques=ataques(1:menorCantidad,:);
    normales=normales(1:menorCantidad,:);

    juntos=[ataques;normales];

    %reorden
    orden = randperm(size(juntos,1));

    for i=1:size(juntos,1)
        x(orden(i),:) = juntos(i,1:41);
        y(orden (i),:) = juntos(i,42);
    end
    for i=1:size(x,2)
        Y(:,i) = (x(:,i)-min(x(:,i)))/(max(x(:,i))-min(x(:,i))+eps);
    end
    x=Y*(b-a)+a;
    
        if tipo==1
            save DataTrn x y
        else
            xv=x;
            yv=y;
            save DataTst xv yv
        end
   clear
end

