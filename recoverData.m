function X_rec = recoverData(Z, U, K)
    X_rec = zeros(size(Z, 1), size(U, 1));	% 初始化恢复数据
    X_rec = Z*U(:,1:K)';					% 在K维度空间取左奇异向量U前K列，进行恢复数据
end
