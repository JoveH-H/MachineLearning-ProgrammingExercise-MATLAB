function [Ynorm, Ymean] = normalizeRatings(Y, R)
    [m, n] = size(Y);								% 获取样本个数，每个样本的特征
    Ymean = zeros(m, 1);							% 初始化评分平均数
    Ynorm = zeros(size(Y));						% 初始化正则化评分
    for i = 1:m
        idx = find(R(i, :) == 1);				% 获取有评分的电影
        Ymean(i) = mean(Y(i, idx));				% 计算评分平均数
        Ynorm(i, idx) = Y(i, idx) - Ymean(i);	% 计算正则化评分
    end
end
