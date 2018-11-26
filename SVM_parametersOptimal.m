clear ; close all; clc					% ������ݺͽ���
load('logicalData2.mat');				% ����logicalData2.mat��X(863*2double), y(863*1double)
m = size(X, 1);							% ����ѵ����������Ŀm
rand_indices = randperm(m);				% ����������1-863
Xtest = X(rand_indices(m-171: m), :);	% ѡȡ���������ŵĺ�171λ��20%������Ϊ���Լ�
ytest = y(rand_indices(m-171: m), 1);	
Xval = X(rand_indices(m-343: m-172), :);% ѡȡ���������ŵĺ�171-343λ��20%������Ϊ������֤��
yval = y(rand_indices(m-343: m-172), 1);	
X = X(rand_indices(1: m-344), :);		% ѡȡʣ������ݣ�60%������Ϊѵ����
y = y(rand_indices(1: m-344), 1);		
m = size(X, 1);							% ����ѵ����������Ŀm
plotLogisticData(X, y);					% �������ݵ�
[C, sigma] = dataset3Params(X, y, Xval, yval);	% ��ȡ���ŵ����򻯲���C�ͱ�׼���
% ����SVMѵ������������ǩ�����򻯲�������˹�˺�����Ĭ�Ϲ���ֵ0.001��Ĭ������������5
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
visualizeBoundaryNolinear (X, y, model);		% ����X�ľ��ߺ������ֽ���
pred = predictNolinearaBility(model,Xtest);	% ����X�ľ��ߺ�������������Ͻ������ǩ��ʶ�ȣ�
accuracy = mean(double(pred == ytest));		% ��������׼ȷ��