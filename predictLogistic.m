function p = predictLogistic(theta, X)
    m = size(X, 1);					% ����ѵ����������Ŀm
    g = sigmoid(X * theta);			% ������躯���Ľ������ʱ��X�����ƫ�õ�Ԫ
    for i = 1:m
        if g(i,1) >= 0.5
            p(i,1) = 1;
        else
            p(i,1) = 0;
        end
end
