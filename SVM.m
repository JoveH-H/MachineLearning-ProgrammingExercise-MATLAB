clear ; close all; clc					% ������ݺͽ���
load('logicalData1.mat');				% ����logicalData1.mat��X(51*2double), y(51*1double)
plotLogisticData(X, y);					% �������ݵ�
C = 1;									% ���򻯲�������ֵԽ�󣬳ͷ�ԽС������Խǿ��
% ����SVMѵ������������ǩ�����򻯲��������Ժ˺���������ֵ0.001������������20 
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);	% svmTrain������svmTrain.m�ļ���
visualizeBoundaryLinear(X, y, model);	% ����X�ľ��ߺ������ֽ���
pred = predictLinearaBility(model, X);	% ����X�ľ��ߺ�������������Ͻ������ǩ��ʶ�ȣ�
accuracy = mean(double(pred == y));     % ��������׼ȷ��

