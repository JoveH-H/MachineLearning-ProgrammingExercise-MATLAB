clear ; close all; clc				% ������ݺͽ���
data = load('housePrices2.txt');	% data��housePrices2.txt�����ݿ��������� 47*3 double 
X = data(:, 1:2);					% XȡhousePrices2.txt�еĵ�һ�����ƽ���͵ڶ������Ҹ���
y = data(:, 3); 					% YȡhousePrices2.txt�еĵ����з���
m = length(y);						% ����ѵ����������Ŀm
[X mu sigma] = featureNormalize(X);% ��������������������Ϊ���ֵ
X = [ones(m, 1), X]; 								% ��X���ƫ�õ�Ԫx_0 x_0=1
theta = zeros(3, 1); 								% ��ʼ����ϲ�����Ϊ0 
num_iters = 400;									% ���õ�������
alpha = 0.01;										% ����ѧϰ���ʦ�
% ���гɱ��ݶ��½�
[theta, J_history] = linearRegGradientDescent(X, y, theta, alpha, num_iters);	
figure;															% ��һ���µ�ͼ�δ���
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);	% ������������
xlabel('Number of iterations');									% ����x���ǩ
ylabel('Cost J');
price =theta' * [1; ([1650; 3] - mu') ./ sigma'];	% �������1600���Ҹ���3ʱ����ϳ��Ľ��