function J = linearRegComputeCost(X, y, theta)
	m = length(y); 							% ����ָ�����������ĳ��� ������ѵ����������Ŀm
	J = 1 / (2 * m)*sum((X*theta - y).^2);	% ������ۣ��ɱ���
end
