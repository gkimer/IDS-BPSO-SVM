function [a b]= svm_pinv(ye,H)

one= ones (size(ye,1),1);
mu = inv(H)*one;
eta = inv(H)*ye;
s=one'*mu;
b=(mu'*ye)./s;
a=eta-(mu*b);


end