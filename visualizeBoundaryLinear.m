function visualizeBoundaryLinear(X, y, model)
    xp = linspace(min(X(:,1)), max(X(:,1)), 100);	% 设置绘制范围
    yp = - (model.w(1)*xp + model.b)/ model.w (2);		% 计算分界值
    hold on;	plot(xp, yp, '-b');	hold off;		% 绘制分界线
end
