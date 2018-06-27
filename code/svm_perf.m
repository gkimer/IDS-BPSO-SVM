function [er] = svm_perf(yv,zv)
    er = mse(yv,zv');
end