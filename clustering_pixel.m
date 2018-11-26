clear ; close all; clc								% 清除数据和界面
A = double(imread('hundreds0fPixel.png'));          % 从图形文件读取图像 长*宽*3（RGB）double
A = A / 255;										% 归一化，使所有的值都在[0, 1]范围内
img_size = size(A);									% 计算图像的长宽
X = reshape(A, img_size(1) * img_size(2), 3);		% 重述图像成 像素点*3（RGB）double
K = 8; 												% 设置聚类中心（颜色）个数
max_iters = 10;										% 最大移动次数10次
initial_centroids = kMeansInitCentroids(X, K);      % 随机初始化聚类中心（需多次尝试）
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);      % 运行k均值算法
X_recovered = centroids(idx,:);						% 像素获取压缩颜色后的RGB值
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3); 	% 重建图像
subplot(1, 2, 1);									% 在平铺位置创建坐标区1
imagesc(A); 										% 显示原始图像
title('Original');									% 设置标题
subplot(1, 2, 2);									% 在平铺位置创建坐标区2
imagesc(X_recovered)								% 显示压缩图像
title(sprintf('Compressed, with %d colors.', K));   % 显示压缩后的颜色数量
