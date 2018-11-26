clear ; close all; clc								% 清除数据和界面
load('clusteringData.mat');							% 加载ClusteringData.mat的X(300*2double)
K = 3;                                              % 设置3个聚类中心
max_iters = 20;										% 最大移动次数20次
initial_centroids = kMeansInitCentroids(X, K);      % 随机初始化聚类中心（需多次尝试）
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true); % 运行k均值算法
