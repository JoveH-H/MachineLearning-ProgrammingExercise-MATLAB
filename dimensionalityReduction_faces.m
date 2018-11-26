clear ; close all; clc								% 清除数据和界面
load('faces.mat');                                  % 加载faces.mat的X(5000*1024double)
display2DGrayData(X(1:100, :));						% 展示前100个人脸数据
[X_norm, mu, sigma] = featureNormalize(X);          % 均值归一化
[U, S] = pca(X_norm);								% 进行主成分分析，获得特征向量U
figure;												% 打开新的绘制窗口
display2DGrayData(U(:, 1:36)');						% 显示前36个重要特征向量，
K = 100;											% 将数据投影到K = 100维空间中
Z = projectData(X_norm, U, K);						% 计算归一化输入X在K维度空间中的投影
X_rec  = recoverData(Z, U, K);						% 在K维度空间中的投影恢复数据
figure;												% 打开新的绘制窗口
subplot(1, 2, 1);									% 在平铺位置创建坐标区1
display2DGrayData(X_norm(1:100,:));                 % 显示前100个归一化的人脸数据
title('Original faces');							% 设置归一化人脸数据标题
axis square;										% 相应调整数据单位间的增量
subplot(1, 2, 2);									% 在平铺位置创建坐标区2
display2DGrayData(X_rec(1:100,:));					% 显示前100个恢复的人脸数据
title('Recovered faces');							% 设置归一化人脸数据标题
axis square;										% 相应调整数据单位间的增量