clear ; close all; clc				% ������ݺͽ���
load ('networkServerData.mat');		% ����networkServerData.mat��ѵ������X(307*2double)
% ���ؽ�����֤����X_val (307*2double), y_val (307*1double)
[mu sigma2] = estimateGaussian(X);			% ������˹�ֲ������ƽ��ֵ�ͷ���
visualizeFit(X,  mu, sigma2);				
xlabel('Latency (ms)');						% ����x��y����⣬��ʱ��������
ylabel('Throughput (mb/s)');
p = multivariateGaussian(X, mu, sigma2);	% ����ԭʼ���ݶ�Ԫ��˹�ֲ��ĸ����ܶ�
pval = multivariateGaussian(Xval, mu, sigma2);	% ���㽻����֤���ݶ�Ԫ��˹�ֲ��ĸ����ܶ�
[epsilon F1] = selectThreshold(yval, pval);		% ����ԭʼ���ݶ�Ԫ��˹�ֲ��ĸ����ܶ�
outliers = find(p < epsilon);
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off
