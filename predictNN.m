function p = predictNN(Theta1, Theta2, X)
    m = size(X, 1);								% ��ȡ�������� 5000
    h1 = sigmoid([ones(m, 1) X] * Theta1');	% ���ƫ�õ�Ԫ
    h2 = sigmoid([ones(m, 1) h1] * Theta2');	% ���ƫ�õ�Ԫ
    [dummy, p] = max(h2, [], 2);	% ����������룬��ÿ�еĲ�����Ӧĳ��ǩ�ļ��躯��������
    % ��ȡÿһ�е�[���ֵ�����ֵ����] 
end
