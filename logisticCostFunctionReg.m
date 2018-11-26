function [J, grad] = logisticCostFunctionReg(theta, X, y, lambda)
    m = length(y); 											% 计算训练样本的数目m
    h = sigmoid(X * theta);									% 设置假设函数
    theta(1,1) = 0;											% 先拟合再置0，因x_0不需要正则化
    J = -1 /m *  ...											% 计算代价
        ((y' * log(h)) + (1 - y)' * log(1 - h)) + lambda / 2 /m *sum(power(theta, 2));
    grad = 1 / m * (h - y)' * X  + lambda / m * theta';	% 更新拟合参数
    grad = grad(:);
end
