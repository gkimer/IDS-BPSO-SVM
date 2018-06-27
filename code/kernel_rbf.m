function [K]= kernel_rbf(Xtrn,sigma2,Xtst)
    Ntrn= size(Xtrn,1);
    if nargin<3,
       x1=sum(Xtrn.^2,2)*ones(1,Ntrn); % (Ntrn,NTrn) matrix
       D=x1+x1'-2*(Xtrn*Xtrn');
       K=exp(-D./(2*sigma2));
    else
       Nt= size(Xtst,1);
       x1=sum(Xtrn.^2,2)*ones(1,Nt);
       x2=sum(Xtst.^2,2)*ones(1,Ntrn);
       D =x1+x2'-2*Xtrn*Xtst';
       K = exp(-D./(2*sigma2));
    end
end
