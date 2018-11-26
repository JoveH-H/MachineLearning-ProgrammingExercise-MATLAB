function [J grad] = nnCostFunction(nn_params, input_layer_size, ...
    hidden_layer_size, num_labels, X, y, lambda)
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1)); 	% ��ȡ��ϲ�����_1
    Theta2 = reshape(nn_params((1 +(hidden_layer_size *(input_layer_size+1))):end), ...
        num_labels, (hidden_layer_size + 1));			% ��ȡ��ϲ�����_2
    Theta1_grad = zeros(size(Theta1));					% ��ʼ������ϲ�����_1
    Theta2_grad = zeros(size(Theta2));					% ��ʼ������ϲ�����_2
    % ǰ�򴫲�
    m = size(X, 1);										% ��ȡ�������� 5000
    a1 = [ones(size(X, 1), 1) X]; 						% ���ƫ�õ�Ԫ����1���Logistic���
    z2 = a1 * Theta1';            						% ��1����2������/��2���Logistic����
    a2 = sigmoid(z2);										% ��2���Logistic���
    a2 = [ones(size(a2, 1), 1) a2]; 					% ���ƫ�õ�Ԫ
    z3 = a2 * Theta2';                						% ��2����3������/��3���Logistic����
    h = sigmoid(z3); 										% ��3���Logistic��� h=a3
    % ������������
    yk = zeros(m, num_labels);							% ��ʼ����¼������ǩ������
    for i = 1:m
        yk(i, y(i)) = 1; 									% ÿһ�У���������Ϊ1���кż�Ϊ��ǩ���
    end
    J = (1 / m)* sum(sum(((-yk).*log(h) - (1 - yk).*log(1 - h)))) + lambda / 2 / ...
        m * (sum(sum(Theta1(:, 2 : end).^2))+sum(sum(Theta2(:, 2 : end).^2))); % �������
    % ���򴫲�
    for i = 1:m
        y_new = zeros(1, num_labels);					% ��ʼ���¼�¼������ǩ������
        y_new(1, y(i)) = 1;								% ���ñ�ǩ��Ŷ�Ӧ���к�Ϊ1��Ϊ���
        a1 = [1; X(i, :)'];								% ����i ���ƫ�õ�Ԫ����1���Logistic���
        a2 = [1; sigmoid(Theta1*a1)];					% ����i ���ƫ�õ�Ԫ����2���Logistic���
        a3 = sigmoid(Theta2*a2);							% ����i ��3���Logistic���
        det3 = a3 - y_new';								% ��3����񾭽ڵ�����
        Theta2_grad = Theta2_grad + det3 * a2';		% ������ϲ�����_2
        det2 = Theta2'*det3.*sigmoidGradient([1;Theta1*a1]);	% ��2����񾭽ڵ�����
        det2 = det2(2:end);								% ��ȥƫ�õ�Ԫ����ϲ���
        Theta1_grad = Theta1_grad + det2 * a1';		% ������ϲ�����_1
    end
    Theta1(:, 1) = 0;	 Theta2(:, 1) = 0;					% ��ƫ�õ�Ԫ����Ҫ����
    Theta1_grad = Theta1_grad / m + lambda * Theta1 / m;	% ������ϲ�����_1
    Theta2_grad = Theta2_grad / m + lambda * Theta2 / m;	% ������ϲ�����_2
    grad = [Theta1_grad(:) ; Theta2_grad(:)];				% ���ϻ���ϲ�����_1  ��_2
end
