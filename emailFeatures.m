function x = emailFeatures(word_indices)
    n = 1899;						% 设置词汇个数，即特征
    x = zeros(n, 1);				% 初始化特征
    for i=1:length(word_indices)
        x(word_indices(i))=1;		% 在对应序号的词汇上特征置1
    end
end
