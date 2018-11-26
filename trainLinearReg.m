function [theta] = trainLinearReg(X, y, lambda)
	initial_theta = zeros(size(X, 2), 1); 						% ��ʼ����ϲ���
	costFunction = @(t) linearRegCostFunctionReg(X, y, t, lambda); % ���ô��ۺ����Ŀɱ���
	options=optimset('GradObj','on','MaxIter',200);	% ʹ���Զ�����ݶ��½���ʽ������200��
	theta = fmincg(costFunction, initial_theta, options);		% ������Сֵ�Ż�
end
