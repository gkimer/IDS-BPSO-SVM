function [zv] = svm_sim(xe,Sigma2,xv,a,b)

K = kernel_rbf(xe,Sigma2,xv);

zv =  a' * K + b;



end
