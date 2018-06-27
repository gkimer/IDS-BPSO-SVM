function [Param] = svm_par(iG,N1,iS,N2,Base)
    inter_gama = Base.^iG;
    inter_sigma = Base.^iS;
    
    for i=1:N1; 
        gamma(i)=(inter_gama(2)- inter_gama(1))*rand+inter_gama(1);
    end
    for i=1:N2; 
        sigma(i)=(inter_sigma(2)- inter_sigma(1))*rand+inter_sigma(1);
    end
    gamma=sort(gamma);
    sigma=sort(sigma);
    
    
    for i=1:N1;
        for j=1:N2;
            Param{i,j}.gamma=gamma(i);
            Param{i,j}.sigma2=sigma(j);
            
        end
    end
%     Param{6}.gamma Se cuentan por columnas hacia abajo
%     Param{6}.sigma
Param;