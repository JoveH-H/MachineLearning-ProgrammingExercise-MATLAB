function X_rec = recoverData(Z, U, K)
    X_rec = zeros(size(Z, 1), size(U, 1));	% ��ʼ���ָ�����
    X_rec = Z*U(:,1:K)';					% ��Kά�ȿռ�ȡ����������UǰK�У����лָ�����
end
