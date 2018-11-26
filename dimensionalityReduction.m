clear ; close all; clc								% 清除数据和界面
load('2DData.mat');									% 加载2DData.mat的X(50*2double)
plot(X(:, 1), X(:, 2), 'bo');						% 绘制原始数据
axis([0.5 6.5 2 8]); axis square;					% 设置x，y轴范围，相应调整数据单位间的增量
[X_norm, mu, sigma] = featureNormalize(X);		% 均值归一化
[U, S] = pca(X_norm);								% 进行主成分分析，获得特征向量U
hold on;							% 绘制以数据均值为中心的特征向量,显示了数据集中最大变化的方向
drawLine(mu, mu + S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;
figure;												% 打开新的绘制窗口
plot(X_norm(:, 1), X_norm(:, 2), 'bo');			% 绘制归一化数据
axis([-4 3 -4 3]); axis square;						% 设置x，y轴范围，相应调整数据单位间的增量
K = 1;													% 将数据投影到K = 1维空间中
Z = projectData(X_norm, U, K);						% 计算归一化输入X在K维度空间中的投影
X_rec  = recoverData(Z, U, K);						% 在K维度空间中的投影恢复数据
hold on;												% 保留当前坐标区中的绘图
plot(X_rec(:, 1), X_rec(:, 2), 'ro');				% 绘制恢复的数据
for i = 1:size(X_norm, 1)							
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);	% 投影数据和恢复数据连线
end
hold off
