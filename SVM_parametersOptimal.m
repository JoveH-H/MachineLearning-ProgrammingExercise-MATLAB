clear ; close all; clc					% 清除数据和界面
load('logicalData2.mat');				% 加载logicalData2.mat的X(863*2double), y(863*1double)
m = size(X, 1);							% 计算训练样本的数目m
rand_indices = randperm(m);				% 设置乱序编号1-863
Xtest = X(rand_indices(m-171: m), :);	% 选取数据乱序编号的后171位（20%），作为测试集
ytest = y(rand_indices(m-171: m), 1);	
Xval = X(rand_indices(m-343: m-172), :);% 选取数据乱序编号的后171-343位（20%），作为交叉验证集
yval = y(rand_indices(m-343: m-172), 1);	
X = X(rand_indices(1: m-344), :);		% 选取剩余的数据（60%），作为训练集
y = y(rand_indices(1: m-344), 1);		
m = size(X, 1);							% 计算训练样本的数目m
plotLogisticData(X, y);					% 绘制数据点
[C, sigma] = dataset3Params(X, y, Xval, yval);	% 获取最优的正则化参数C和标准差σ
% 设置SVM训练：特征，标签，正则化参数，高斯核函数，默认公差值0.001，默认最大迭代次数5
model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
visualizeBoundaryNolinear (X, y, model);		% 根据X的决策函数画分界线
pred = predictNolinearaBility(model,Xtest);	% 根据X的决策函数计算样本拟合结果（标签相识度）
accuracy = mean(double(pred == ytest));		% 计算分类的准确率