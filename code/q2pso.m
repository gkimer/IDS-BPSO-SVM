clear
load optimo
load DataTrn
load DataTst

[~,b] = find(gBest(1,:));
xe = x(:,b);
xv = xv(:,b);



    N=300;%train
    M=300;%test

    xe=xe(1:N,:);
    ye=y(1:N,:);
    xv=xv(1:M,:);
    yv=yv(1:M,:);

    % Parameters LS-SVM
    iG=[27 28]; % Gamma interval 
    N1=30; % Number samples
    iS=[-4 -2]; % Sigma2 interval
    N2=30; % Number samples
    Base=2; % Base 2 or 10
    Param=svm_par(iG,N1,iS,N2,Base);

    for i=1:(N1*N2)
        % Training
        Gamma = Param{i}.gamma;
        Sigma2 = Param{i}.sigma2;
        [a b] = svm_train(xe,ye,Gamma,Sigma2);
        % testing
        zv = svm_sim(xe,Sigma2,xv,a,b);
        % Accuracy
        er = svm_perf(yv,zv);
        Err(i) = er;
        Coef(i).a=a; 
        Coef(i).b=b;

    end
    fit = min(Err);



[mx , indx]=min(Err);
Gamma=Param{indx}.gamma;
Sig2=Param{indx}.sigma2;
a=Coef(indx).a;
b=Coef(indx).b;
zv=svm_sim(xe,Sig2,xv,a,b);



[y1 , z1]=svm_confusion(yv,zv);

fprintf('Caracteristicas: \n');
display(find(gBest==1));

figure(1)
plotconfusion(y1,z1)
