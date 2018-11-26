function plotTranscriptData(X, y)
    figure; hold on;					% ���µ�ͼ�Σ�������ǰ���ͼ��
    pos = find(y == 1);					% �ҳ����¼ȡ��λ�ã�����¼ȡΪ+
    neg = find(y == 0);					% �ҳ����δ¼ȡ��λ�ã�����δ¼ȡΪo
    plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2,'MarkerSize', 7);
    plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
    hold off;							% ���ٸ��´�ͼ��
end
