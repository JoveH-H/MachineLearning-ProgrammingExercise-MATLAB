function [mu sigma2] = estimateGaussian(X)
    [m, n] = size(X);			% 获取样本个数，每个样本的特征
    mu = mean(X);         		% 求各样本平均值
    sigma2 = var(X,1);  		% 求方差
end
