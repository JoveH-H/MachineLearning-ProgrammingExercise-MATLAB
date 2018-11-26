function centroids = computeCentroids(X, idx, K)
    [m n] = size(X);									% 获取样本个数 300，每个样本的特征 2
    centroids = zeros(K, n);							% 初始化聚类中心
    for i=1:K
        temp=find(idx==i);							% 寻找同一类的样本
        centroids(i,:)=sum(X(temp,:))/size(X(temp,:),1);	% 计算样本平均值更新聚类中心
    end
end
