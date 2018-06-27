
function [fit] = q1(x,y,xv,yv)

    N=300;%train
    M=300;%test

    xe=x(1:N,:);
    ye=y(1:N,:);
    xv=xv(1:M,:);
    yv=yv(1:M,:);

    % Parameters LS-SVM
    iG=[27 28]; % Gamma interval 
    N1=10; % Number samples
    iS=[-4 -2]; % Sigma2 interval
    N2=10; % Number samples
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
    end
    fit = min(Err);
end