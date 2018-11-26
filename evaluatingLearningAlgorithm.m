clear ; close all; clc				% 清除数据和界面
load ('simulationData.mat');		% 加载simulationData.mat的训练特征X(12*1double), y(12*1double)
                                    % 加载测试特征X_test (21*1double), y_test (21*1double)
                                    % 加载交叉验证特征X_val (21*1double), y_val (21*1double)
m = size(X, 1);						% 获取样本个数 12
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);   % 显示大小10，线粗1.5红色X点表示X,y关系
xlabel('Change in water level (x)');                    % 设置x轴标签
ylabel('Water flowing out of the dam (y)');
lambda = 0;												% 设置正则化参数
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);	% 训练线性回归获取最优拟合参数
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);   % 显示大小10，线粗1.5红色X点表示X,y关系
xlabel('Change in water level (x)');					% 设置x轴标签
ylabel('Water flowing out of the dam (y)');
hold on;												% 保留当前坐标区中的绘图
plot(X, [ones(m, 1) X]*theta, '--', 'LineWidth', 2)     % 绘制拟合曲线
hold off;
[error_train,error_val]= ...                            % 获取训练的代价和交叉验证的代价
	learningCurve([ones(m,1) X],y,[ones(size(Xval,1),1) Xval], yval,lambda);	
figure;                                                 % 打开新的绘制窗口
plot(1:m, error_train, 1:m, error_val);	% 绘制随样本个数变化，训练和交叉验证的代价变化曲线
title('Learning curve for linear regression')			% 设置标题
legend('Train', 'Cross Validation')                     % 设置图例
xlabel('Number of training examples')					% 设置x轴标签
ylabel('Error')											
axis([0 13 0 150])										% 设置x，y轴范围
p = 8;													% 设置多项式最高次方
X_poly = polyFeatures(X, p);							% 设置多特征集12*8 double
[X_poly, mu, sigma] = featureNormalize(X_poly);  		% 均值归一化多特征集
X_poly = [ones(m, 1), X_poly];                   		% 添加偏置单元，特征集12*9 double
X_poly_val = polyFeatures(Xval, p);                     % 设置多交叉验证特征集21*8 double
X_poly_val = bsxfun(@minus, X_poly_val, mu);			% 均值化，使用训练集的平均值
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);	% 归一化，使用训练集的标准差
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];	% 添加偏置单元，特征集21*9 double 
X_poly_test = polyFeatures(Xtest, p);					% 设置多测试特征集21*8 double
X_poly_test = bsxfun(@minus, X_poly_test, mu);          % 均值化，使用训练集的平均值
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma); 	% 归一化，使用训练集的标准差
X_poly_test = [ones(size(X_poly_test,1), 1), X_poly_test];  % 添加偏置单元，特征集21*9 double
lambda = 1;													% 设置正则化参数（此处较优可修改）
[theta] = trainLinearReg(X_poly, y, lambda);				% 训练线性回归
figure;														% 绘制数据和拟合曲线
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);       % 绘制X, y的关系
plotFit(min(X), max(X), mu, sigma, theta, p);				% 绘制拟合多项式曲线
xlabel('Change in water level (x)');						% 设置x轴标签
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));	% 设置标题
figure;														% 绘制多特征和高次多项式回学习曲线
[error_train, error_val] = learningCurve(X_poly, y, X_poly_val, yval, lambda);
plot(1:m, error_train, 1:m, error_val);					
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')						% 设置x轴标签
ylabel('Error')												
axis([0 13 0 100])											% 设置x，y轴范围
legend('Train', 'Cross Validation')                         % 设置图例

% 获取不同的正则化参数时的学习曲线数据
[lambda_vec, error_train, error_val] = validationCurve(X_poly, y, X_poly_val, yval);
% 绘制不同的正则化参数时，训练和交叉验证代价的变化曲线
figure;                                                 % 打开新的绘制窗口
plot(lambda_vec, error_train, lambda_vec, error_val); 
legend('Train', 'Cross Validation');					% 设置图例
xlabel('lambda');										% 设置x，y轴标题
ylabel('Error');

