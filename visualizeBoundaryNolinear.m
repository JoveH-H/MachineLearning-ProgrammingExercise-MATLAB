function visualizeBoundaryNolinear (X, y, model, varargin)
    x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';	% ��������1���Ʒ�Χ
    x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)'; 	% ��������2���Ʒ�Χ
    [X1, X2] = meshgrid(x1plot, x2plot);					% �����������
    vals = zeros(size(X1));									% ��ʼ����Ͻ��
    for i = 1:size(X1, 2)									% ������Ͻ��
    this_X = [X1(:, i), X2(:, i)];						
    vals(:, i) = predictNolinearaBility(model, this_X);			
    end
    hold on;													% ������ǰ�������еĻ�ͼ
    contour(X1, X2, vals, [0.5 0.5], 'b');					% ����0.5�ֽ�ĵȸ���ͼ
    hold off;
end
