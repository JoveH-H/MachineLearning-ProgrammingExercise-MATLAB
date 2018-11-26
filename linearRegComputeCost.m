function J = linearRegComputeCost(X, y, theta)
	m = length(y); 							% 计算指定向量或矩阵的长度 即计算训练样本的数目m
	J = 1 / (2 * m)*sum((X*theta - y).^2);	% 计算代价（成本）
end
