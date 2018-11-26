clear ; close all; clc					% 清除数据和界面
data = load('transcript.txt');			% data把transcript.txt的数据拷贝到自身 100*3 double
X = data(:, [1, 2]); y = data(:, 3); 	% X取第一、二列科目的成绩，Y取第三列录取结果（1 录取）
plotLogisticData(X, y);                 % 展示数据
hold on;									% 保留当前坐标区中的绘图
xlabel('Exam 1 score')					% 设置x,y轴标签
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')		% 设置图例
hold off;									% 不再更新此图形
[m, n] = size(X);											% 计算训练样本的数目m，特征数n
X = [ones(m, 1) X];										% 给X添加偏置单元x_0 x_0=1
initial_theta = zeros(n + 1, 1);						% 初始化拟合参数
options = optimset('GradObj', 'on', 'MaxIter', 400); % 使用自定义的梯度下降公式，迭代400次
% 代价函数最小值优化
[theta, cost] = fminunc(@(t)( logisticCostFunction(t, X, y)), initial_theta, options);
plotDecisionBoundary(theta, X, y);						% 绘制决策边缘
p = predictLogistic(theta, X);							% 计算样本拟合结果
accuracy = mean(double(p == y));						% 计算分类的准确率
prob = sigmoid([1 45 85] * theta);						% 计算科目成绩45、85拟合的录取结果
