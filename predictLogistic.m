function p = predictLogistic(theta, X)
    m = size(X, 1);					% 计算训练样本的数目m
    g = sigmoid(X * theta);			% 计算假设函数的结果，此时的X已添加偏置单元
    for i = 1:m
        if g(i,1) >= 0.5
            p(i,1) = 1;
        else
            p(i,1) = 0;
        end
end
