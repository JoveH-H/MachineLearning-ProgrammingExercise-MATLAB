clear ; close all; clc				% 清除数据和界面
data = load('housePrices2.txt');	% data把housePrices2.txt的数据拷贝到自身 47*3 double 
X = data(:, 1:2);					% X取housePrices2.txt中的第一列面积平方和第二列卧室个数
y = data(:, 3); 					% Y取housePrices2.txt中的第三列房价
m = length(y);						% 计算训练样本的数目m
[X mu sigma] = featureNormalize(X);% 缩放特征，并将其设置为零均值
X = [ones(m, 1), X]; 								% 给X添加偏置单元x_0 x_0=1
theta = zeros(3, 1); 								% 初始化拟合参数Θ为0 
num_iters = 400;									% 设置迭代次数
alpha = 0.01;										% 设置学习速率α
% 运行成本梯度下降
[theta, J_history] = linearRegGradientDescent(X, y, theta, alpha, num_iters);	
figure;															% 打开一个新的图形窗口
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);	% 绘制收敛曲线
xlabel('Number of iterations');									% 设置x轴标签
ylabel('Cost J');
price =theta' * [1; ([1650; 3] - mu') ./ sigma'];	% 计算面积1600卧室个数3时，拟合出的结果