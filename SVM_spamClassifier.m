clear ; close all; clc				% ������ݺͽ���
load('spamTrain.mat');				% ����ѵ�����ʻ�����X(4000*1899double), ��ǩy(4000*1double)
C = 0.1;                                        % ���򻯲���
% ����SVMѵ������������ǩ�����򻯲��������Ժ˺���������ֵ0.001������������5
model = svmTrain(X, y, C, @linearKernel);
p = predictLinearaBility(model, X);                       % ���ѵ������ǩ
train_accuracy = mean(double(p == y));          % �������ѵ������ǩ��׼ȷ��
load('spamTest.mat');                           % ���ز��Լ�����X_test (1000*1899double), y_test (1000*1double)
ptest = predictLinearaBility(model, Xtest);               % ��ϲ��Լ���ǩ
test_accuracy = mean(double(ptest == ytest));	% ������ϲ��Լ���ǩ��׼ȷ��
file_contents = readFile('emailSample.txt');	% ��ȡ��Ҫ�б���ʼ�����(���޸�)
word_indices = processEmail(file_contents);		% Ԥ������Ҫ�б���ʼ�
features = emailFeatures(word_indices);			% ��ȡ��Ҫ�б���ʼ�����
pred0 = predictLinearaBility(model, features); 	% ��Ͻ�����ж��Ƿ�Ϊ�����ʼ�(0)
file_contents = readFile('spamSample.txt');     % ��ȡ��Ҫ�б���ʼ�����(���޸�)
word_indices = processEmail(file_contents);		% Ԥ������Ҫ�б���ʼ�
features = emailFeatures(word_indices);			% ��ȡ��Ҫ�б���ʼ�����
pred1 = predictLinearaBility(model, features); 	% ��Ͻ�����ж��Ƿ�Ϊ�����ʼ�(1)