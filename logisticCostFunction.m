function [J, grad] = logisticCostFunction(theta, X, y)
    m = length(y); 										% 计算训练样本的数目m
    % 计算代价
    J = -1 /m * ((y' * log(sigmoid(X * theta))) + (1 - y)' * log(1 - sigmoid(X * theta)));
    grad =1 / m * (sigmoid(X * theta) - y)' * X ;		% 更新拟合参数
end
