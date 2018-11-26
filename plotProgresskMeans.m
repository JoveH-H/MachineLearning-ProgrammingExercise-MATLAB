function plotProgresskMeans(X, centroids, previous, idx, K, i)
    palette = hsv(K + 1);							% ������ɫ��
    colors = palette(idx, :);						% ���ݾ������ĵ���Ŀ���䲻ͬ��ɫ
    scatter(X(:,1), X(:,2), 15, colors);			% ����15��С��ԲȦɢ��ͼ
    plot(centroids(:,1), centroids(:,2), 'x', 'MarkerEdgeColor','k', ...
        'MarkerSize', 10, 'LineWidth', 3);			% ���ƾ�������
    for j=1:size(centroids,1)
        drawLine(centroids(j, :), previous(j, :));	% ���߾�������
    end
    title(sprintf('Iteration number %d', i))		% ��ʾ�������
end
