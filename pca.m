function [U, S] = pca(X)
    [m, n] = size(X);					% 获取样本个数，每个样本的特征
    U = zeros(n);						% 初始化左奇异向量
    S = zeros(n);						% 初始化奇异值（对角矩阵）
    Sigma = 1/m*(X')*X;					% 计算协方差矩阵（总变差）
    [U, S, V] = svd(Sigma);				% 奇异值分解
end
