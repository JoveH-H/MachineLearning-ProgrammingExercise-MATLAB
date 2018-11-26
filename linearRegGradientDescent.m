function [theta, J_history, theta_history] = linearRegGradientDescent(X, y, theta, alpha, num_iters)
    [m, n] = size(X); 						% 获取样本个数，特征个数
    J_history = zeros(num_iters, 1);		% 初始化代价（成本）记录数组 J__history 为0
    theta_history = zeros(10,n);            % 初始化拟合参数记录数组 theta_history为0
    for iter = 1:num_iters					% 迭代
        theta = theta - alpha / m * X'* (X * theta - y);			% 同时更新拟合参数
        J_history(iter) = linearRegComputeCost(X, y, theta);        % 记录每次的代价（成本）
        if(rem(iter, num_iters/10)==0)								% 记录10次拟合参数
            theta_history(iter,:) = theta;
        end
    end
end
