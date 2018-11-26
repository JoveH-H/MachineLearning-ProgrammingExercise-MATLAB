function plotTranscriptData(X, y)
    figure; hold on;					% 打开新的图形，并保持前面的图形
    pos = find(y == 1);					% 找出结果录取的位置，绘制录取为+
    neg = find(y == 0);					% 找出结果未录取的位置，绘制未录取为o
    plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2,'MarkerSize', 7);
    plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
    hold off;							% 不再更新此图形
end
