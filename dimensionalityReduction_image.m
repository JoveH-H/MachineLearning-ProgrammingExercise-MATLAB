clear ; close all; clc								% ������ݺͽ���
A = double(imread('hundreds0fPixel.png'));         % ��ͼ���ļ���ȡͼ�� ��*��*3��RGB��double
A = A / 255;										% ��һ����ʹ���е�ֵ����[0, 1]��Χ��
img_size = size(A);									% ����ͼ��ĳ���
X = reshape(A, img_size(1) * img_size(2), 3);		% ����ͼ��� ���ص�*3��RGB��double
K = 8; 												% ���þ������ģ���ɫ������
max_iters = 10;										% ����ƶ�����10��
initial_centroids = kMeansInitCentroids(X, K);      % �����ʼ���������ģ����γ��ԣ�
[centroids, idx] = runkMeans(X, initial_centroids, max_iters); 	% ����k��ֵ�㷨
sel = floor(rand(1000, 1) * size(X, 1)) + 1;		% �����ȡ1000�����ص�
palette = hsv(K);									% ������ɫ��
colors = palette(idx(sel), :);						% ���ݾ������ĵ���Ŀ1000���䲻ͬ��ɫ
figure;												% ���µĻ��ƴ���
scatter3(X(sel, 1), X(sel, 2), X(sel, 3), 10, colors);	% �滭��άɢ��ͼ
title('Pixel dataset plotted in 3D. Color shows centroid memberships');	% ���ñ���
[X_norm, mu, sigma] = featureNormalize(X);          % ��ֵ��һ��	
[U, S] = pca(X_norm);								% �������ɷַ����������������U
Z = projectData(X_norm, U, 2);						% �����һ������X��Kά�ȿռ��е�ͶӰ
figure;												% ���µĻ��ƴ���
plotDataPoints(Z(sel, :), idx(sel), K);             % �����һ������X��Kά�ȿռ��е�ͶӰ
title('Pixel dataset plotted in 2D, using PCA for dimensionality reduction');
