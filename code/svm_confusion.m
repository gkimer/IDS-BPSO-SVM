function [y1 , z1]=svm_confusion(yv,zv)

    for i=1:size(yv)
        if yv(i)==-1
            y1(i)=0;
        else
            y1(i)=1;
        end

    end
    zv=zv';
    for i=1:size(zv)
        if zv(i)<0;
            z1(i)=0;
            else
                if zv(i)>0;
                    z1(i)=1;
                end
        end
    end
    
    
    
%Testeamos el aprendizaje de la red por medio de una matriz de confusion 
[c,cm,ind,per] = confusion(y1,z1);

precision = per(:,3);

Rden =  sum(cm,2);%En la suma de la columna obtenemos vp+fn
Rnom = diag(cm);%en la diagonal se encuentran los valores vp
sensibilidad= Rnom./Rden;


fscore = 2*(precision.*sensibilidad)./(sensibilidad+precision);

display(fscore)

end