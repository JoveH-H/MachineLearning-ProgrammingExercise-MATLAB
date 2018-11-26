function idx = findClosestCentroids(X, centroids)
    K = size(centroids, 1);							% 获取聚类中心个数
    idx = zeros(size(X,1), 1);						% 初始化样本对应的标签列表
    value=zeros(K,1);								% 初始化某样本对不同聚类中心的距离
    for i=1:size(X,1)								% 历遍所有样本
        for j=1:K									% 计算样本对不同聚类中心的距离
            value(j)=sum((X(i,:)-centroids(j,:)) .^ 2);
        end
        [val, idx(i)]=min(value);					% 获取最近聚类中心的编号
    end
end
