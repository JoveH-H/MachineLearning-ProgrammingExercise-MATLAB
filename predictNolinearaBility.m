function pred = predictNolinearaBility(model, X)
    if strfind(func2str(model.kernelFunction), 'gaussianKernel')   % ȷ��ѵ����Ϊ��˹�˺���
        if (size(X, 2) == 1)						% ȷ��X������ȷ
            X = X';
        end
        m = size(X, 1);							% ��ȡ��������
        p = zeros(m, 1);							% ��ʼ��������ǩ
        pred = zeros(m, 1);						% ��ʼ�����ձ�ǩ
        X1 = sum(X.^2, 2);
        X2 = sum(model.X.^2, 2)';
        K = bsxfun(@plus, X1, bsxfun(@plus, X2, - 2 * X * model.X'));
        K = model.kernelFunction(1, 0) .^ K;
        K = bsxfun(@times, model.y', K);
        K = bsxfun(@times, model.alphas', K);
        p = sum(K, 2);
        pred(p >= 0) =  1;						% ������Ͻ��>0ʱ��Ԥ�⺯��>0.5����ǩΪ1
        pred(p <  0) =  0;
    end
end
