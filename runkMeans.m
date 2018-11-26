function [centroids, idx] = runkMeans(X, initial_centroids, max_iters, plot_progress)
    if ~exist('plot_progress', 'var') || isempty(plot_progress)
        plot_progress = false;						% 设置绘图进度默认值关闭
    end
    if plot_progress								% 若绘图则打开窗口
        figure;		hold on;
    end
    [m n] = size(X);								% 获取样本个数 300，每个样本的特征 2
    K = size(initial_centroids, 1);					% 获取聚类中心个数
    centroids = initial_centroids;					% 获取初始聚类中心
    previous_centroids = centroids;					% 设置旧聚类中心
    idx = zeros(m, 1);								% 初始化样本对应的标签列表
    for i=1:max_iters
        fprintf('K-Means iteration %d/%d...\n', i, max_iters);	% 显示运算进度
        idx = findClosestCentroids(X, centroids);	% 将样本分配到其最近的质心
        if plot_progress							% 绘制运算进度
            plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
            previous_centroids = centroids;			% 更新旧聚类中心
        end
        centroids = computeCentroids(X, idx, K);	% 计算新的聚类中心
    end
    if plot_progress
        hold off;									% 关闭绘图保持
    end
end
