clear ; close all; clc								% ������ݺͽ���
load('2DData.mat');									% ����2DData.mat��X(50*2double)
plot(X(:, 1), X(:, 2), 'bo');						% ����ԭʼ����
axis([0.5 6.5 2 8]); axis square;					% ����x��y�᷶Χ����Ӧ�������ݵ�λ�������
[X_norm, mu, sigma] = featureNormalize(X);		% ��ֵ��һ��
[U, S] = pca(X_norm);								% �������ɷַ����������������U
hold on;							% ���������ݾ�ֵΪ���ĵ���������,��ʾ�����ݼ������仯�ķ���
drawLine(mu, mu + S(1,1) * U(:,1)', '-k', 'LineWidth', 2);
drawLine(mu, mu + S(2,2) * U(:,2)', '-k', 'LineWidth', 2);
hold off;
figure;												% ���µĻ��ƴ���
plot(X_norm(:, 1), X_norm(:, 2), 'bo');			% ���ƹ�һ������
axis([-4 3 -4 3]); axis square;						% ����x��y�᷶Χ����Ӧ�������ݵ�λ�������
K = 1;													% ������ͶӰ��K = 1ά�ռ���
Z = projectData(X_norm, U, K);						% �����һ������X��Kά�ȿռ��е�ͶӰ
X_rec  = recoverData(Z, U, K);						% ��Kά�ȿռ��е�ͶӰ�ָ�����
hold on;												% ������ǰ�������еĻ�ͼ
plot(X_rec(:, 1), X_rec(:, 2), 'ro');				% ���ƻָ�������
for i = 1:size(X_norm, 1)							
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);	% ͶӰ���ݺͻָ���������
end
hold off
