clear ; close all; clc					% 清除数据和界面
load('digitalImages.mat');				% 加载digitalImages.mat的X(5000*400double),Y(5000*1double)
[m n]= size(X);							% 获取样本个数 5000，特征个数（每个样本的输入层数） 400
num_labels = 10;          				% 样本的标签个数 10 （0-9共10个,0用10表示）
rand_indices = randperm(m);				% 设置乱序编号1-400
sel = X(rand_indices(1:100), :);		% 选取乱序编号的前100位
display2DGrayData(sel);                 % 展示选取的100个样本
X = [ones(m, 1) X];										% 给X添加偏置单元x_0 x_0=1
all_theta = zeros(num_labels, n + 1);					% 初始化全部标签的拟合参数10*401 double
initial_theta = zeros(n + 1, 1);						% 初始化某一标签的拟合参数（辅助计算）
lambda = 0.1;											% 设置正则化参数，防止过拟合
options = optimset('GradObj', 'on', 'MaxIter', 50);     % 使用自定义的梯度下降公式，迭代50次
for c=1:num_labels										% 对所有标签进行代价函数最小值优化
    [theta]=...
        fmincg(@(t)( logisticCostFunctionReg(t,X,(y==c),lambda)), initial_theta, options);
    all_theta(c,:) = theta';							% 整合不同标签的最优拟合参数
end;
pred = predictOneVsAll(all_theta, X);					% 计算样本拟合结果（标签）
accuracy = mean(double(pred == y));                     % 计算分类的准确率
