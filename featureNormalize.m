function [X_norm, mu, sigma] = featureNormalize(X)
	mu = mean(X);                               % 计算每个特征的平均值
    X_norm = bsxfun(@minus, X, mu);				% 计算每个样本特性与特征平均值的差
    sigma = std(X_norm);						% 计算每个样本的标准差
    X_norm = bsxfun(@rdivide, X_norm, sigma); 	% 均值归一化
end
