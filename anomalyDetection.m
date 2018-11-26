clear ; close all; clc				% 清除数据和界面
load ('networkServerData.mat');		% 加载networkServerData.mat的训练特征X(307*2double)
% 加载交叉验证特征X_val (307*2double), y_val (307*1double)
[mu sigma2] = estimateGaussian(X);			% 评估高斯分布，获得平均值和方差
visualizeFit(X,  mu, sigma2);				
xlabel('Latency (ms)');						% 设置x，y轴标题，延时和吞吐量
ylabel('Throughput (mb/s)');
p = multivariateGaussian(X, mu, sigma2);	% 计算原始数据多元高斯分布的概率密度
pval = multivariateGaussian(Xval, mu, sigma2);	% 计算交叉验证数据多元高斯分布的概率密度
[epsilon F1] = selectThreshold(yval, pval);		% 计算原始数据多元高斯分布的概率密度
outliers = find(p < epsilon);
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off
