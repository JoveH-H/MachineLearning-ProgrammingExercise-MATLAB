function [lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval)
    lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10]';	% ��ʼ����ͬ���򻯲���
    for i = 1:length(lambda_vec)
        lambda = lambda_vec(i);											% ���ò�ͬ���򻯲���	
        theta = trainLinearReg(X, y, lambda);							% ���������ϲ���
        error_train(i) = linearRegCostFunctionReg(X, y, theta, 0); 		% ����ѵ������
        error_val(i) = linearRegCostFunctionReg(Xval, yval, theta, 0);	% ���㽻����֤����
    end;
end
