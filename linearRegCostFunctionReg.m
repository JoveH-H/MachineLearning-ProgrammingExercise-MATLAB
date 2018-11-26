function [J, grad] = linearRegCostFunctionReg(X, y, theta, lambda)
    m = length(y);										% ��ȡ�������������
    % �����������Իع����
    J=1 / (2 * m) * sum((X * theta - y).^2)+lambda/2/m*sum(theta(2:end,:) .^ 2);
    temp=theta;
    temp(1,1)=0;										% ��ƫ�õ�Ԫ����Ҫ����
    grad=(1/m)*sum((X*theta-y) .* X)+lambda/m*temp';	% ������ϲ���
    grad = grad(:);										% ������ϲ���
end

