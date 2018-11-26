function [Ynorm, Ymean] = normalizeRatings(Y, R)
    [m, n] = size(Y);								% ��ȡ����������ÿ������������
    Ymean = zeros(m, 1);							% ��ʼ������ƽ����
    Ynorm = zeros(size(Y));						% ��ʼ����������
    for i = 1:m
        idx = find(R(i, :) == 1);				% ��ȡ�����ֵĵ�Ӱ
        Ymean(i) = mean(Y(i, idx));				% ��������ƽ����
        Ynorm(i, idx) = Y(i, idx) - Ymean(i);	% ������������
    end
end
