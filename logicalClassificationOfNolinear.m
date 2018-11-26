clear ; close all; clc					% ������ݺͽ���
data = load('chipTest.txt');			% data��chipTest.txt�����ݿ��������� 118*3 double
X = data(:, [1, 2]); y = data(:, 3); 	% Xȡ��һ������оƬ����ƫ�Yȡ������������1 �ϸ�
plotLogisticData(X, y);                 % չʾ����
hold on;								% ������ǰ�������еĻ�ͼ
xlabel(' Microchip Test 1')				% ����x, y���ǩ
ylabel(' Microchip Test 2')
legend('y = 1', 'y = 0')				% ����ͼ��
hold off;								% ���ٸ��´�ͼ��
X = mapFeature(X(:,1), X(:,2));			% ��Ӷ���ʽ����������ƫ�õ�Ԫx_0
initial_theta = zeros(size(X, 2), 1);	% ��ʼ����ϲ���
lambda = 1;								% �������򻯲�������ֹ�����
options = optimset('GradObj', 'on', 'MaxIter', 400);	% ʹ���Զ�����ݶ��½���ʽ������400��
% ���ۺ�����Сֵ�Ż�
[theta, J, exit_flag] = ...
    fminunc(@(t)( logisticCostFunctionReg(t, X, y, lambda)), initial_theta, options);
plotDecisionBoundary(theta, X, y);		% ���ƾ��߱�Ե
hold on;								% ������ǰ�������еĻ�ͼ
title(sprintf('lambda = %g', lambda)) 	% ����ǰ���ͼ�οɼ�
legend('y = 1', 'y = 0', 'Decision boundary')	% ����ͼ��
hold off;								% ���ٸ��´�ͼ��
p = predictLogistic(theta, X);					% ����������Ͻ��
accuracy = mean(double(p == y));		% ��������׼ȷ��
X_test = mapFeature(-0.6,0.4);			% ������ƫ��-0.6��0.4ӳ�������
prob = sigmoid([X_test] * theta);		% �������ƫ����ϵ�¼ȡ���
