function centroids = computeCentroids(X, idx, K)
    [m n] = size(X);									% ��ȡ�������� 300��ÿ������������ 2
    centroids = zeros(K, n);							% ��ʼ����������
    for i=1:K
        temp=find(idx==i);							% Ѱ��ͬһ�������
        centroids(i,:)=sum(X(temp,:))/size(X(temp,:),1);	% ��������ƽ��ֵ���¾�������
    end
end
