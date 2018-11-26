function [lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval)
    lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';	% 初始化不同正则化参数
    for i = 1:length(lambda_vec)
        lambda = lambda_vec(i);											% 设置不同正则化参数	
        theta = trainLinearReg(X, y, lambda);							% 计算最佳拟合参数
        error_train(i) = linearRegCostFunctionReg(X, y, theta, 0); 		% 计算训练代价
        error_val(i) = linearRegCostFunctionReg(Xval, yval, theta, 0);	% 计算交叉验证代价
    end;
end
