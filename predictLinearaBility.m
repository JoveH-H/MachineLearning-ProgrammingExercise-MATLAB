function p = predictLinearaBility(model, X)
    if (size(X, 2) == 1)								% 确保X输入正确
        X = X';
    end
    m = size(X, 1);									% 计算训练样本的数目m
    g = 1 ./(1 + exp(-(X*model.w + model.b)));	% 计算决策函数进行sigmoid假设函数预测
    for i = 1:m
        if g(i,1) >= 0.5						% 计算拟合结果>0时，逻辑回归预测函数>0.5，标签为1
            p(i,1) = 1;
        else
            p(i,1) = 0;
        end
end
