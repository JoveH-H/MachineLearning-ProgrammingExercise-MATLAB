function plotDataPoints(X, idx, K)
    palette = hsv(K + 1);							% 创建调色板
    colors = palette(idx, :);						% 根据聚类中心的数目分配不同颜色
    scatter(X(:,1), X(:,2), 15, colors);			% 绘画三维散点图
end
