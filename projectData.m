function Z = projectData(X, U, K)
    Z = zeros(size(X, 1), K);			% ��ʼ��ͶӰ����
    Z = X * U(:,1:K) ;					% ȡ����������UǰK�У�����Kά�ȿռ�ͶӰ
end
