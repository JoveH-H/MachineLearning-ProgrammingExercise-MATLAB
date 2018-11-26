clear ; close all; clc								% ������ݺͽ���
load('faces.mat');                                  % ����faces.mat��X(5000*1024double)
display2DGrayData(X(1:100, :));						% չʾǰ100����������
[X_norm, mu, sigma] = featureNormalize(X);          % ��ֵ��һ��
[U, S] = pca(X_norm);								% �������ɷַ����������������U
figure;												% ���µĻ��ƴ���
display2DGrayData(U(:, 1:36)');						% ��ʾǰ36����Ҫ����������
K = 100;											% ������ͶӰ��K = 100ά�ռ���
Z = projectData(X_norm, U, K);						% �����һ������X��Kά�ȿռ��е�ͶӰ
X_rec  = recoverData(Z, U, K);						% ��Kά�ȿռ��е�ͶӰ�ָ�����
figure;												% ���µĻ��ƴ���
subplot(1, 2, 1);									% ��ƽ��λ�ô���������1
display2DGrayData(X_norm(1:100,:));                 % ��ʾǰ100����һ������������
title('Original faces');							% ���ù�һ���������ݱ���
axis square;										% ��Ӧ�������ݵ�λ�������
subplot(1, 2, 2);									% ��ƽ��λ�ô���������2
display2DGrayData(X_rec(1:100,:));					% ��ʾǰ100���ָ�����������
title('Recovered faces');							% ���ù�һ���������ݱ���
axis square;										% ��Ӧ�������ݵ�λ�������