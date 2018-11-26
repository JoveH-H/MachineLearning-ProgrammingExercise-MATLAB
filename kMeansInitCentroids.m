function centroids = kMeansInitCentroids(X, K)
    centroids = zeros(K, size(X, 2));				% 初始化聚类中心3*2
    randidx = randperm(size(X, 1)); 				% 设置乱序编号1-300
    centroids = X(randidx(1:K), :);					% 随机选取3个数据作为聚类中心
end
