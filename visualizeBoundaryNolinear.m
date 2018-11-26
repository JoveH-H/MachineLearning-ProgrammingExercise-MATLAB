function visualizeBoundaryNolinear (X, y, model, varargin)
    x1plot = linspace(min(X(:,1)), max(X(:,1)), 100)';	% 设置特征1绘制范围
    x2plot = linspace(min(X(:,2)), max(X(:,2)), 100)'; 	% 设置特征2绘制范围
    [X1, X2] = meshgrid(x1plot, x2plot);					% 生成网格矩阵
    vals = zeros(size(X1));									% 初始化拟合结果
    for i = 1:size(X1, 2)									% 计算拟合结果
    this_X = [X1(:, i), X2(:, i)];						
    vals(:, i) = predictNolinearaBility(model, this_X);			
    end
    hold on;													% 保留当前坐标区中的绘图
    contour(X1, X2, vals, [0.5 0.5], 'b');					% 绘制0.5分界的等高线图
    hold off;
end
