function [mu sigma2] = estimateGaussian(X)
    [m, n] = size(X);			% ��ȡ����������ÿ������������
    mu = mean(X);         		% �������ƽ��ֵ
    sigma2 = var(X,1);  		% �󷽲�
end
