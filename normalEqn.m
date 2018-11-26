function [theta] = normalEqn(X, y)
	theta = zeros(size(X, 2), 1);
    theta = pinv(X' * X) * X' * y;  % 正规方程解出向量θ=〖(X'* X)〗^(-1) * X'* y
end
