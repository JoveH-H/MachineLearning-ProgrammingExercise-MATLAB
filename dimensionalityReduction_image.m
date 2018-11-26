clear ; close all; clc								% 清除数据和界面
A = double(imread('hundreds0fPixel.png'));         % 从图形文件读取图像 长*宽*3（RGB）double
A = A / 255;										% 归一化，使所有的值都在[0, 1]范围内
img_size = size(A);									% 计算图像的长宽
X = reshape(A, img_size(1) * img_size(2), 3);		% 重述图像成 像素点*3（RGB）double
K = 8; 												% 设置聚类中心（颜色）个数
max_iters = 10;										% 最大移动次数10次
initial_centroids = kMeansInitCentroids(X, K);      % 随机初始化聚类中心（需多次尝试）
[centroids, idx] = runkMeans(X, initial_centroids, max_iters); 	% 运行k均值算法
sel = floor(rand(1000, 1) * size(X, 1)) + 1;		% 随机抽取1000个像素点
palette = hsv(K);									% 创建调色板
colors = palette(idx(sel), :);						% 根据聚类中心的数目1000分配不同颜色
figure;												% 打开新的绘制窗口
scatter3(X(sel, 1), X(sel, 2), X(sel, 3), 10, colors);	% 绘画三维散点图
title('Pixel dataset plotted in 3D. Color shows centroid memberships');	% 设置标题
[X_norm, mu, sigma] = featureNormalize(X);          % 均值归一化	
[U, S] = pca(X_norm);								% 进行主成分分析，获得特征向量U
Z = projectData(X_norm, U, 2);						% 计算归一化输入X在K维度空间中的投影
figure;												% 打开新的绘制窗口
plotDataPoints(Z(sel, :), idx(sel), K);             % 计算归一化输入X在K维度空间中的投影
title('Pixel dataset plotted in 2D, using PCA for dimensionality reduction');
