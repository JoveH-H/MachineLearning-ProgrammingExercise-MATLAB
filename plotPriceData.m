function plotPriceData(x, y)
    figure; 								% ��һ���µ�ͼ�δ���
    plot(x, y, 'rx', 'MarkerSize', 10); 	% �������� ����ɫX�͡� ������ ����СΪ10��
    ylabel('Profit in $10,000s'); 			% ����y���ǩ
    xlabel('Population of City in 10,000s');
end
