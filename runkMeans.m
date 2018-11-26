function [centroids, idx] = runkMeans(X, initial_centroids, max_iters, plot_progress)
    if ~exist('plot_progress', 'var') || isempty(plot_progress)
        plot_progress = false;						% ���û�ͼ����Ĭ��ֵ�ر�
    end
    if plot_progress								% ����ͼ��򿪴���
        figure;		hold on;
    end
    [m n] = size(X);								% ��ȡ�������� 300��ÿ������������ 2
    K = size(initial_centroids, 1);					% ��ȡ�������ĸ���
    centroids = initial_centroids;					% ��ȡ��ʼ��������
    previous_centroids = centroids;					% ���þɾ�������
    idx = zeros(m, 1);								% ��ʼ��������Ӧ�ı�ǩ�б�
    for i=1:max_iters
        fprintf('K-Means iteration %d/%d...\n', i, max_iters);	% ��ʾ�������
        idx = findClosestCentroids(X, centroids);	% ���������䵽�����������
        if plot_progress							% �����������
            plotProgresskMeans(X, centroids, previous_centroids, idx, K, i);
            previous_centroids = centroids;			% ���¾ɾ�������
        end
        centroids = computeCentroids(X, idx, K);	% �����µľ�������
    end
    if plot_progress
        hold off;									% �رջ�ͼ����
    end
end
