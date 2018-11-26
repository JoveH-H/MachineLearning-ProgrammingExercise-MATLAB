function p = predictLinearaBility(model, X)
    if (size(X, 2) == 1)								% ȷ��X������ȷ
        X = X';
    end
    m = size(X, 1);									% ����ѵ����������Ŀm
    g = 1 ./(1 + exp(-(X*model.w + model.b)));	% ������ߺ�������sigmoid���躯��Ԥ��
    for i = 1:m
        if g(i,1) >= 0.5						% ������Ͻ��>0ʱ���߼��ع�Ԥ�⺯��>0.5����ǩΪ1
            p(i,1) = 1;
        else
            p(i,1) = 0;
        end
end
