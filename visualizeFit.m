function visualizeFit(X, mu, sigma2)
    [X1,X2] = meshgrid(0:.5:35); 				% ���ض�ά��������
    Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2); % �������ݶ�Ԫ��˹�ֲ��ĸ����ܶ�
    Z = reshape(Z,size(X1));						% ��������ܶ�����
    plot(X(:, 1), X(:, 2),'bx');				% ��������
    hold on;										% ������ǰ�������еĻ�ͼ
    if (sum(isinf(Z)) == 0)						% ����в���ʽ�Ͳ�Ҫ��ͼ
        contour(X1, X2, Z, 10.^(-20:3:0)');		% ���Ƶȸ���
    end
    hold off;										% �رջ�ͼ����
end
