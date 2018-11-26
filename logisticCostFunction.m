function [J, grad] = logisticCostFunction(theta, X, y)
    m = length(y); 										% ����ѵ����������Ŀm
    % �������
    J = -1 /m * ((y' * log(sigmoid(X * theta))) + (1 - y)' * log(1 - sigmoid(X * theta)));
    grad =1 / m * (sigmoid(X * theta) - y)' * X ;		% ������ϲ���
end
