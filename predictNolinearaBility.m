function pred = predictNolinearaBility(model, X)
    if strfind(func2str(model.kernelFunction), 'gaussianKernel')   % 确认训练的为高斯核函数
        if (size(X, 2) == 1)						% 确保X输入正确
            X = X';
        end
        m = size(X, 1);							% 获取样本个数
        p = zeros(m, 1);							% 初始化辅助标签
        pred = zeros(m, 1);						% 初始化最终标签
        X1 = sum(X.^2, 2);
        X2 = sum(model.X.^2, 2)';
        K = bsxfun(@plus, X1, bsxfun(@plus, X2, - 2 * X * model.X'));
        K = model.kernelFunction(1, 0) .^ K;
        K = bsxfun(@times, model.y', K);
        K = bsxfun(@times, model.alphas', K);
        p = sum(K, 2);
        pred(p >= 0) =  1;						% 计算拟合结果>0时，预测函数>0.5，标签为1
        pred(p <  0) =  0;
    end
end
