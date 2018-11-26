function [X_norm, mu, sigma] = featureNormalize(X)
	mu = mean(X);                               % ����ÿ��������ƽ��ֵ
    X_norm = bsxfun(@minus, X, mu);				% ����ÿ����������������ƽ��ֵ�Ĳ�
    sigma = std(X_norm);						% ����ÿ�������ı�׼��
    X_norm = bsxfun(@rdivide, X_norm, sigma); 	% ��ֵ��һ��
end
