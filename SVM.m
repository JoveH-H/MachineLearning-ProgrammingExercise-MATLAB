clear ; close all; clc					% 清除数据和界面
load('logicalData1.mat');				% 加载logicalData1.mat的X(51*2double), y(51*1double)
plotLogisticData(X, y);					% 绘制数据点
C = 1;									% 正则化参数（数值越大，惩罚越小，敏感越强）
% 设置SVM训练：特征，标签，正则化参数，线性核函数，公差值0.001，最大迭代次数20 
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);	% svmTrain函数在svmTrain.m文件中
visualizeBoundaryLinear(X, y, model);	% 根据X的决策函数画分界线
pred = predictLinearaBility(model, X);	% 根据X的决策函数计算样本拟合结果（标签相识度）
accuracy = mean(double(pred == y));     % 计算分类的准确率

