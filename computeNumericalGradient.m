function numgrad = computeNumericalGradient(J, theta)
    numgrad = zeros(size(theta));				% 初始化数值梯度
    perturb = zeros(size(theta));				% 初始化偏导数
    e = 1e-4;									% 设置分差为0.001
    for p = 1:numel(theta)						% 对所有拟合参数求偏差
        perturb(p) = e;							% 设置分差
        loss1 = J(theta - perturb);				% 计算偏导数
        loss2 = J(theta + perturb);
        numgrad(p) = (loss2 - loss1) / (2*e);	% 计算梯度
        perturb(p) = 0;							% 重置分差
    end
end
