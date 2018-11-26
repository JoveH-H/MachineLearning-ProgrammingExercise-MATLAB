function p = multivariateGaussian(X, mu, Sigma2)
    k = length(mu);					% 获取样本个数
    if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)	% 若方差为向量
        Sigma2 = diag(Sigma2);		% 创建对角矩阵或获取矩阵的对角元素
    end
    X = bsxfun(@minus, X, mu(:)');	% 计算概率密度
    p = (2 * pi) ^ (- k / 2) * det(Sigma2) ^ (-0.5) * ...
        exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));
end
