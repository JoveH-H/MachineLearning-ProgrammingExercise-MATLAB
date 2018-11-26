function sim = gaussianKernel(x1, x2, sigma)
    x1 = x1(:); x2 = x2(:);							% 确保x1和x2是列向量
    sim= exp(-sum((x1 - x2) .^ 2)/(2 * sigma^2));	% 计算高斯核函数得出相似度（类似正态分布）
end
