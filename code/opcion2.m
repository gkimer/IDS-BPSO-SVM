function opcion = opcion2(data)
    
    caracteristicas = [1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 14, 22, 23, 24, 27, 29, 30, 32, 34, 35, 36, 37, 38, 40];
    contador = 0;
    for i=1:41
        if find(caracteristicas==i)
            contador = contador + 1;
            if contador == 1
                opcion = [data(:,i)];
            else
                opcion = [opcion data(:,i)];
            end
        end
    end
    
end