function T =  numeros(columna)
    
unicos=unique(columna);
    for i=1:size(unicos)
        T(strcmp(columna,unicos(i)))=i;
    end
T=T';
end