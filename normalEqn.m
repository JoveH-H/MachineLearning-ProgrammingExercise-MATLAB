function [theta] = normalEqn(X, y)
	theta = zeros(size(X, 2), 1);
    theta = pinv(X' * X) * X' * y;  % ���淽�̽��������=��(X'* X)��^(-1) * X'* y
end
