function plotDataPoints(X, idx, K)
    palette = hsv(K + 1);							% ������ɫ��
    colors = palette(idx, :);						% ���ݾ������ĵ���Ŀ���䲻ͬ��ɫ
    scatter(X(:,1), X(:,2), 15, colors);			% �滭��άɢ��ͼ
end
