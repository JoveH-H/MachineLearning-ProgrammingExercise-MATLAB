function x = emailFeatures(word_indices)
    n = 1899;						% ���ôʻ������������
    x = zeros(n, 1);				% ��ʼ������
    for i=1:length(word_indices)
        x(word_indices(i))=1;		% �ڶ�Ӧ��ŵĴʻ���������1
    end
end
