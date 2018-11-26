clear ; close all; clc					% ������ݺͽ���
load('digitalImages.mat');				% ����digitalImages.mat��X(5000*400double),Y(5000*1double)
[m n]= size(X);							% ��ȡ�������� 5000������������ÿ����������������� 400
num_labels = 10;          				% �����ı�ǩ���� 10 ��0-9��10��,0��10��ʾ��
rand_indices = randperm(m);				% ����������1-400
sel = X(rand_indices(1:100), :);		% ѡȡ�����ŵ�ǰ100λ
display2DGrayData(sel);                 % չʾѡȡ��100������
X = [ones(m, 1) X];										% ��X���ƫ�õ�Ԫx_0 x_0=1
all_theta = zeros(num_labels, n + 1);					% ��ʼ��ȫ����ǩ����ϲ���10*401 double
initial_theta = zeros(n + 1, 1);						% ��ʼ��ĳһ��ǩ����ϲ������������㣩
lambda = 0.1;											% �������򻯲�������ֹ�����
options = optimset('GradObj', 'on', 'MaxIter', 50);     % ʹ���Զ�����ݶ��½���ʽ������50��
for c=1:num_labels										% �����б�ǩ���д��ۺ�����Сֵ�Ż�
    [theta]=...
        fmincg(@(t)( logisticCostFunctionReg(t,X,(y==c),lambda)), initial_theta, options);
    all_theta(c,:) = theta';							% ���ϲ�ͬ��ǩ��������ϲ���
end;
pred = predictOneVsAll(all_theta, X);					% ����������Ͻ������ǩ��
accuracy = mean(double(pred == y));                     % ��������׼ȷ��
