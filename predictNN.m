function p = predictNN(Theta1, Theta2, X)
    m = size(X, 1);								% 获取样本个数 5000
    h1 = sigmoid([ones(m, 1) X] * Theta1');	% 添加偏置单元
    h2 = sigmoid([ones(m, 1) h1] * Theta2');	% 添加偏置单元
    [dummy, p] = max(h2, [], 2);	% 计算拟合输入，即每行的参数对应某标签的假设函数的输入
    % 获取每一行的[最大值，最大值列数] 
end
