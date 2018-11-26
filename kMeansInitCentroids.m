function centroids = kMeansInitCentroids(X, K)
    centroids = zeros(K, size(X, 2));				% ��ʼ����������3*2
    randidx = randperm(size(X, 1)); 				% ����������1-300
    centroids = X(randidx(1:K), :);					% ���ѡȡ3��������Ϊ��������
end
