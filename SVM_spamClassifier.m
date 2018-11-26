clear ; close all; clc				% 清除数据和界面
load('spamTrain.mat');				% 加载训练集词汇特征X(4000*1899double), 标签y(4000*1double)
C = 0.1;                                        % 正则化参数
% 设置SVM训练：特征，标签，正则化参数，线性核函数，公差值0.001，最大迭代次数5
model = svmTrain(X, y, C, @linearKernel);
p = predictLinearaBility(model, X);                       % 拟合训练集标签
train_accuracy = mean(double(p == y));          % 计算拟合训练集标签的准确率
load('spamTest.mat');                           % 加载测试集特征X_test (1000*1899double), y_test (1000*1double)
ptest = predictLinearaBility(model, Xtest);               % 拟合测试集标签
test_accuracy = mean(double(ptest == ytest));	% 计算拟合测试集标签的准确率
file_contents = readFile('emailSample.txt');	% 读取需要判别的邮件内容(可修改)
word_indices = processEmail(file_contents);		% 预处理需要判别的邮件
features = emailFeatures(word_indices);			% 提取需要判别的邮件特征
pred0 = predictLinearaBility(model, features); 	% 拟合结果，判断是否为正常邮件(0)
file_contents = readFile('spamSample.txt');     % 读取需要判别的邮件内容(可修改)
word_indices = processEmail(file_contents);		% 预处理需要判别的邮件
features = emailFeatures(word_indices);			% 提取需要判别的邮件特征
pred1 = predictLinearaBility(model, features); 	% 拟合结果，判断是否为垃圾邮件(1)