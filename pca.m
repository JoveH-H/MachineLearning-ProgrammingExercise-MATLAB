function [U, S] = pca(X)
    [m, n] = size(X);					% ��ȡ����������ÿ������������
    U = zeros(n);						% ��ʼ������������
    S = zeros(n);						% ��ʼ������ֵ���ԽǾ���
    Sigma = 1/m*(X')*X;					% ����Э��������ܱ�
    [U, S, V] = svd(Sigma);				% ����ֵ�ֽ�
end
