function [error_train, error_val] = learningCurve(X, y, Xval, yval, lambda)
    m = length(y);										% 获取计算的样本个数
    for i = 1:m
        theta = trainLinearReg(X(1:i,:), y(1:i), lambda);
        error_train(i) = linearRegCostFunctionReg(X(1:i,:), y(1:i), theta, 0);
        error_val(i) = linearRegCostFunctionReg(Xval, yval, theta, 0);
    end
end
