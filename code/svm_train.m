function [a b]= svm_train(xe,ye,Gamma,Sigma2)
%Train SVM

K = kernel_rbf(xe,Sigma2);

H = K + eye(size(K))*1/Gamma;

[a b]= svm_pinv(ye,H);

end