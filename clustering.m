clear ; close all; clc								% ������ݺͽ���
load('clusteringData.mat');							% ����ClusteringData.mat��X(300*2double)
K = 3;                                              % ����3����������
max_iters = 20;										% ����ƶ�����20��
initial_centroids = kMeansInitCentroids(X, K);      % �����ʼ���������ģ����γ��ԣ�
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true); % ����k��ֵ�㷨
