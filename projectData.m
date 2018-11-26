function Z = projectData(X, U, K)
    Z = zeros(size(X, 1), K);			% 初始化投影数据
    Z = X * U(:,1:K) ;					% 取左奇异向量U前K列，进行K维度空间投影
end
