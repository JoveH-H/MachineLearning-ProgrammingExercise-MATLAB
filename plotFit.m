function plotFit(min_x, max_x, mu, sigma, theta, p)
    hold on;										% ������ǰ�������еĻ�ͼ
    x = (min_x - 15: 0.05 : max_x + 25)';			% 0.05����������X�ķ�Χ
    X_poly = polyFeatures(x, p);					% ����ʽӳ��
    X_poly = bsxfun(@minus, X_poly, mu);			% X��ƽ�������������Ԫ��������
    X_poly = bsxfun(@rdivide, X_poly, sigma);		% X�ͱ�׼�����������Ԫ��������
    X_poly = [ones(size(x, 1), 1) X_poly];			% ���ƫ�õ�Ԫ
    plot(x, X_poly * theta, '--', 'LineWidth', 2)	% �����������
    hold off
end
