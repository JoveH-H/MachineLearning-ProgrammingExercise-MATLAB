function [J, grad] = linearRegCostFunctionReg(X, y, theta, lambda)
    m = length(y);										% 获取计算的样本个数
    % 计算正则化线性回归代价
    J=1 / (2 * m) * sum((X * theta - y).^2)+lambda/2/m*sum(theta(2:end,:) .^ 2);
    temp=theta;
    temp(1,1)=0;										% 因偏置单元不需要正则化
    grad=(1/m)*sum((X*theta-y) .* X)+lambda/m*temp';	% 更新拟合参数
    grad = grad(:);										% 整合拟合参数
end

