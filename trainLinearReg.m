function [theta] = trainLinearReg(X, y, lambda)
	initial_theta = zeros(size(X, 2), 1); 						% 初始化拟合参数
	costFunction = @(t) linearRegCostFunctionReg(X, y, t, lambda); % 设置代价函数的可变量
	options=optimset('GradObj','on','MaxIter',200);	% 使用自定义的梯度下降公式，迭代200次
	theta = fmincg(costFunction, initial_theta, options);		% 代价最小值优化
end
