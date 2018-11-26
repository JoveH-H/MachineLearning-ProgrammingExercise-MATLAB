function plotProgresskMeans(X, centroids, previous, idx, K, i)
    palette = hsv(K + 1);							% 创建调色板
    colors = palette(idx, :);						% 根据聚类中心的数目分配不同颜色
    scatter(X(:,1), X(:,2), 15, colors);			% 绘制15大小的圆圈散点图
    plot(centroids(:,1), centroids(:,2), 'x', 'MarkerEdgeColor','k', ...
        'MarkerSize', 10, 'LineWidth', 3);			% 绘制聚类中心
    for j=1:size(centroids,1)
        drawLine(centroids(j, :), previous(j, :));	% 连线聚类中心
    end
    title(sprintf('Iteration number %d', i))		% 显示运算次数
end
