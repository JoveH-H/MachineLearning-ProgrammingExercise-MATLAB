function idx = findClosestCentroids(X, centroids)
    K = size(centroids, 1);							% ��ȡ�������ĸ���
    idx = zeros(size(X,1), 1);						% ��ʼ��������Ӧ�ı�ǩ�б�
    value=zeros(K,1);								% ��ʼ��ĳ�����Բ�ͬ�������ĵľ���
    for i=1:size(X,1)								% ������������
        for j=1:K									% ���������Բ�ͬ�������ĵľ���
            value(j)=sum((X(i,:)-centroids(j,:)) .^ 2);
        end
        [val, idx(i)]=min(value);					% ��ȡ����������ĵı��
    end
end
