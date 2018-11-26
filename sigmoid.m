function g = sigmoid(z)
	g = 1 ./(1 + exp(-z));	% 设置拟合参数和特征x在假设函数的表现形式
end
