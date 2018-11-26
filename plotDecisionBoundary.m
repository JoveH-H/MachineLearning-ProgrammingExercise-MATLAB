function plotDecisionBoundary(theta, X, y)
    hold on;											% ������ǰ�������еĻ�ͼ
    if size(X, 2) <= 3								% ��ֱ�ߵ����
        plot_x = [min(X(:,2))-2,  max(X(:,2))+2];	% ����һ��ֻ��Ҫ�����㣬���ѡ�������˵�
        plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));	% ������߽߱���
        plot(plot_x, plot_y)											% ��ͼ
        legend('Admitted', 'Not admitted', 'Decision Boundary')	% ����ͼ��
        axis([30, 100, 30, 100])						% �����᷶Χ���Ա���õز鿴
    else if size(X, 2) >= 3							% �����ߵ����
        u = linspace(-1, 1.5, 50);					% ��������Χ
        v = linspace(-1, 1.5, 50);
        z = zeros(length(u), length(v));			% ��ʼ����ά����
        for i = 1:length(u)
            for j = 1:length(v)
                z(i,j) = mapFeature(u(i), v(j))*theta;	% ����ӳ�����Ե���Ͻ��
            end
        end
        z = z'; 						% �ڵ�������֮ǰ��ת��z
        % ��ָ����Χ[0,0]�л����� ����0Ϊ�ֽ续��һ���ȸ��ߣ�Ҳ����ʹ��[0, 0.5,1]������3��������ϸ����
        contour(u, v, z, [0, 0], 'LineWidth', 2)
   end
   hold off;
end
