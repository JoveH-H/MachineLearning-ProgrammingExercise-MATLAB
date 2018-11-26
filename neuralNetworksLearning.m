clear ; close all; clc					% ������ݺͽ���
load('digitalImages.mat');				% ����digitalImages.mat��X(5000*400double),Y(5000*1double) 
[m input_layer_size]= size(X);			% ��ȡ�������� 5000��ÿ��������������� 400
hidden_layer_size = 25;   				% ����Ψһ�����ز�Ľ����� 25+1
num_labels = 10;          				% �����ı�ǩ������� 10 ��0-9��10��,0��10��ʾ��
rand_indices = randperm(m);				% ����������1-400
sel = X(rand_indices(1:100), :);		% ѡȡ�����ŵ�ǰ100λ
display2DGrayData(sel);					% չʾѡȡ��100������
Theta1 = randInitializeWeights(input_layer_size,hidden_layer_size); % �����ʼ����ϲ�����_1
Theta2 = randInitializeWeights(hidden_layer_size, num_labels);		% �����ʼ����ϲ�����_2
initial_nn_params = [Theta1(:) ; Theta2(:)];	% ������ϲ���[��_1; ��_2]
options = optimset('MaxIter', 50);				% ���õ���50��
lambda = 1;										% �������򻯲�������ֹ�����
[nn_params, cost] = fmincg(@(p) nnCostFunction(p, input_layer_size, ...
 									hidden_layer_size, num_labels, X, y, lambda), ...
initial_nn_params, options);                    % ���д��ۺ�����Сֵ�Ż�
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));	% ��ȡ��ϲ�����_1
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));	 		% ��ȡ��ϲ�����_2
pred = predictNN(Theta1, Theta2, X);				% ����������Ͻ������ǩ��
accuracy = mean(double(pred == y));					% ��������׼ȷ��
rp = randperm(m);									% ����������1-400
display2DGrayData(X(rp(1:16), :));					% չʾ�����ŵ�ǰ15������
pred = predictNN(Theta1, Theta2, X(rp(1:16),:));	% ��ȡǰ16��������Ԥ���ǩ
