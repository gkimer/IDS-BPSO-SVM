clear
load Parametros
load DataTst
load DataTrn 
N=300;
M=300;

xe=x(1:N,:);
ye=y(1:N,:);
xv=xv(1:M,:);
yv=yv(1:M,:);


[mx , indx]=min(Err);
Gamma=Param{indx}.gamma;
Sig2=Param{indx}.sigma2;
a=Coef(indx).a;
b=Coef(indx).b;
zv=svm_sim(xe,Sig2,xv,a,b);



[y1 , z1]=svm_confusion(yv,zv);

figure(1)
plotconfusion(y1,z1)
