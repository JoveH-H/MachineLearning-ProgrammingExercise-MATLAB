clear ; close all; clc					% 清除数据和界面
data = load('chipTest.txt');			% data把chipTest.txt的数据拷贝到自身 118*3 double
X = data(:, [1, 2]); y = data(:, 3); 	% X取第一、二列芯片测试偏差，Y取第三列质量（1 合格）
plotLogisticData(X, y);                 % 展示数据
hold on;								% 保留当前坐标区中的绘图
xlabel(' Microchip Test 1')				% 设置x, y轴标签
ylabel(' Microchip Test 2')
legend('y = 1', 'y = 0')				% 设置图例
hold off;								% 不再更新此图形
X = mapFeature(X(:,1), X(:,2));			% 添加多项式特征，包含偏置单元x_0
initial_theta = zeros(size(X, 2), 1);	% 初始化拟合参数
lambda = 1;								% 设置正则化参数，防止过拟合
options = optimset('GradObj', 'on', 'MaxIter', 400);	% 使用自定义的梯度下降公式，迭代400次
% 代价函数最小值优化
[theta, J, exit_flag] = ...
    fminunc(@(t)( logisticCostFunctionReg(t, X, y, lambda)), initial_theta, options);
plotDecisionBoundary(theta, X, y);		% 绘制决策边缘
hold on;								% 保留当前坐标区中的绘图
title(sprintf('lambda = %g', lambda)) 	% 保持前面的图形可见
legend('y = 1', 'y = 0', 'Decision boundary')	% 设置图例
hold off;								% 不再更新此图形
p = predictLogistic(theta, X);					% 计算样本拟合结果
accuracy = mean(double(p == y));		% 计算分类的准确率
X_test = mapFeature(-0.6,0.4);			% 将测试偏差-0.6、0.4映射多特征
prob = sigmoid([X_test] * theta);		% 计算测试偏差拟合的录取结果
