function [J grad] = nnCostFunction(nn_params, input_layer_size, ...
    hidden_layer_size, num_labels, X, y, lambda)
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1)); 	% 提取拟合参数Θ_1
    Theta2 = reshape(nn_params((1 +(hidden_layer_size *(input_layer_size+1))):end), ...
        num_labels, (hidden_layer_size + 1));			% 提取拟合参数Θ_2
    Theta1_grad = zeros(size(Theta1));					% 初始化新拟合参数Θ_1
    Theta2_grad = zeros(size(Theta2));					% 初始化新拟合参数Θ_2
    % 前向传播
    m = size(X, 1);										% 获取样本个数 5000
    a1 = [ones(size(X, 1), 1) X]; 						% 添加偏置单元，第1层的Logistic输出
    z2 = a1 * Theta1';            						% 第1到第2层的输出/第2层的Logistic输入
    a2 = sigmoid(z2);										% 第2层的Logistic输出
    a2 = [ones(size(a2, 1), 1) a2]; 					% 添加偏置单元
    z3 = a2 * Theta2';                						% 第2到第3层的输出/第3层的Logistic输入
    h = sigmoid(z3); 										% 第3层的Logistic输出 h=a3
    % 计算输出层误差
    yk = zeros(m, num_labels);							% 初始化记录样本标签的数组
    for i = 1:m
        yk(i, y(i)) = 1; 									% 每一行（样本）中为1的列号即为标签序号
    end
    J = (1 / m)* sum(sum(((-yk).*log(h) - (1 - yk).*log(1 - h)))) + lambda / 2 / ...
        m * (sum(sum(Theta1(:, 2 : end).^2))+sum(sum(Theta2(:, 2 : end).^2))); % 计算误差
    % 反向传播
    for i = 1:m
        y_new = zeros(1, num_labels);					% 初始化新记录样本标签的数组
        y_new(1, y(i)) = 1;								% 设置标签序号对应的列号为1作为标记
        a1 = [1; X(i, :)'];								% 样本i 添加偏置单元，第1层的Logistic输出
        a2 = [1; sigmoid(Theta1*a1)];					% 样本i 添加偏置单元，第2层的Logistic输出
        a3 = sigmoid(Theta2*a2);							% 样本i 第3层的Logistic输出
        det3 = a3 - y_new';								% 第3层的神经节点的误差
        Theta2_grad = Theta2_grad + det3 * a2';		% 更新拟合参数Θ_2
        det2 = Theta2'*det3.*sigmoidGradient([1;Theta1*a1]);	% 第2层的神经节点的误差
        det2 = det2(2:end);								% 除去偏置单元的拟合参数
        Theta1_grad = Theta1_grad + det2 * a1';		% 更新拟合参数Θ_1
    end
    Theta1(:, 1) = 0;	 Theta2(:, 1) = 0;					% 因偏置单元不需要正则化
    Theta1_grad = Theta1_grad / m + lambda * Theta1 / m;	% 正则化拟合参数Θ_1
    Theta2_grad = Theta2_grad / m + lambda * Theta2 / m;	% 正则化拟合参数Θ_2
    grad = [Theta1_grad(:) ; Theta2_grad(:)];				% 整合化拟合参数Θ_1  Θ_2
end
