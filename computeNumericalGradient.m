function numgrad = computeNumericalGradient(J, theta)
    numgrad = zeros(size(theta));				% ��ʼ����ֵ�ݶ�
    perturb = zeros(size(theta));				% ��ʼ��ƫ����
    e = 1e-4;									% ���÷ֲ�Ϊ0.001
    for p = 1:numel(theta)						% ��������ϲ�����ƫ��
        perturb(p) = e;							% ���÷ֲ�
        loss1 = J(theta - perturb);				% ����ƫ����
        loss2 = J(theta + perturb);
        numgrad(p) = (loss2 - loss1) / (2*e);	% �����ݶ�
        perturb(p) = 0;							% ���÷ֲ�
    end
end
