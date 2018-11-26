clear ; close all; clc								% ������ݺͽ���
A = double(imread('hundreds0fPixel.png'));          % ��ͼ���ļ���ȡͼ�� ��*��*3��RGB��double
A = A / 255;										% ��һ����ʹ���е�ֵ����[0, 1]��Χ��
img_size = size(A);									% ����ͼ��ĳ���
X = reshape(A, img_size(1) * img_size(2), 3);		% ����ͼ��� ���ص�*3��RGB��double
K = 8; 												% ���þ������ģ���ɫ������
max_iters = 10;										% ����ƶ�����10��
initial_centroids = kMeansInitCentroids(X, K);      % �����ʼ���������ģ����γ��ԣ�
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);      % ����k��ֵ�㷨
X_recovered = centroids(idx,:);						% ���ػ�ȡѹ����ɫ���RGBֵ
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3); 	% �ؽ�ͼ��
subplot(1, 2, 1);									% ��ƽ��λ�ô���������1
imagesc(A); 										% ��ʾԭʼͼ��
title('Original');									% ���ñ���
subplot(1, 2, 2);									% ��ƽ��λ�ô���������2
imagesc(X_recovered)								% ��ʾѹ��ͼ��
title(sprintf('Compressed, with %d colors.', K));   % ��ʾѹ�������ɫ����
