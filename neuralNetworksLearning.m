clear ; close all; clc					% 清除数据和界面
load('digitalImages.mat');				% 加载digitalImages.mat的X(5000*400double),Y(5000*1double) 
[m input_layer_size]= size(X);			% 获取样本个数 5000，每个样本的输入层数 400
hidden_layer_size = 25;   				% 设置唯一的隐藏层的结点个数 25+1
num_labels = 10;          				% 样本的标签种类个数 10 （0-9共10个,0用10表示）
rand_indices = randperm(m);				% 设置乱序编号1-400
sel = X(rand_indices(1:100), :);		% 选取乱序编号的前100位
display2DGrayData(sel);					% 展示选取的100个样本
Theta1 = randInitializeWeights(input_layer_size,hidden_layer_size); % 随机初始化拟合参数Θ_1
Theta2 = randInitializeWeights(hidden_layer_size, num_labels);		% 随机初始化拟合参数Θ_2
initial_nn_params = [Theta1(:) ; Theta2(:)];	% 整合拟合参数[Θ_1; Θ_2]
options = optimset('MaxIter', 50);				% 设置迭代50次
lambda = 1;										% 设置正则化参数，防止过拟合
[nn_params, cost] = fmincg(@(p) nnCostFunction(p, input_layer_size, ...
 									hidden_layer_size, num_labels, X, y, lambda), ...
initial_nn_params, options);                    % 进行代价函数最小值优化
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));	% 提取拟合参数Θ_1
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));	 		% 提取拟合参数Θ_2
pred = predictNN(Theta1, Theta2, X);				% 计算样本拟合结果（标签）
accuracy = mean(double(pred == y));					% 计算分类的准确率
rp = randperm(m);									% 设置乱序编号1-400
display2DGrayData(X(rp(1:16), :));					% 展示乱序编号的前15个样本
pred = predictNN(Theta1, Theta2, X(rp(1:16),:));	% 获取前16个样本的预测标签
