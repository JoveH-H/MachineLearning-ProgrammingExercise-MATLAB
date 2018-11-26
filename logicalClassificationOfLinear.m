clear ; close all; clc					% ������ݺͽ���
data = load('transcript.txt');			% data��transcript.txt�����ݿ��������� 100*3 double
X = data(:, [1, 2]); y = data(:, 3); 	% Xȡ��һ�����п�Ŀ�ĳɼ���Yȡ������¼ȡ�����1 ¼ȡ��
plotLogisticData(X, y);                 % չʾ����
hold on;									% ������ǰ�������еĻ�ͼ
xlabel('Exam 1 score')					% ����x,y���ǩ
ylabel('Exam 2 score')
legend('Admitted', 'Not admitted')		% ����ͼ��
hold off;									% ���ٸ��´�ͼ��
[m, n] = size(X);											% ����ѵ����������Ŀm��������n
X = [ones(m, 1) X];										% ��X���ƫ�õ�Ԫx_0 x_0=1
initial_theta = zeros(n + 1, 1);						% ��ʼ����ϲ���
options = optimset('GradObj', 'on', 'MaxIter', 400); % ʹ���Զ�����ݶ��½���ʽ������400��
% ���ۺ�����Сֵ�Ż�
[theta, cost] = fminunc(@(t)( logisticCostFunction(t, X, y)), initial_theta, options);
plotDecisionBoundary(theta, X, y);						% ���ƾ��߱�Ե
p = predictLogistic(theta, X);							% ����������Ͻ��
accuracy = mean(double(p == y));						% ��������׼ȷ��
prob = sigmoid([1 45 85] * theta);						% �����Ŀ�ɼ�45��85��ϵ�¼ȡ���
