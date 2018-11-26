function [J, grad] = logisticCostFunctionReg(theta, X, y, lambda)
    m = length(y); 											% ����ѵ����������Ŀm
    h = sigmoid(X * theta);									% ���ü��躯��
    theta(1,1) = 0;											% ���������0����x_0����Ҫ����
    J = -1 /m *  ...											% �������
        ((y' * log(h)) + (1 - y)' * log(1 - h)) + lambda / 2 /m *sum(power(theta, 2));
    grad = 1 / m * (h - y)' * X  + lambda / m * theta';	% ������ϲ���
    grad = grad(:);
end
