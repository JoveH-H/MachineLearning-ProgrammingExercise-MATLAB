function visualizeBoundaryLinear(X, y, model)
    xp = linspace(min(X(:,1)), max(X(:,1)), 100);	% ���û��Ʒ�Χ
    yp = - (model.w(1)*xp + model.b)/ model.w (2);		% ����ֽ�ֵ
    hold on;	plot(xp, yp, '-b');	hold off;		% ���Ʒֽ���
end
