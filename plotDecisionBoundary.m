function plotDecisionBoundary(theta, X, y)
    hold on;											% 保留当前坐标区中的绘图
    if size(X, 2) <= 3								% 画直线的情况
        plot_x = [min(X(:,2))-2,  max(X(:,2))+2];	% 定义一行只需要两个点，因此选择两个端点
        plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));	% 计算决策边界线
        plot(plot_x, plot_y)											% 绘图
        legend('Admitted', 'Not admitted', 'Decision Boundary')	% 设置图例
        axis([30, 100, 30, 100])						% 调整轴范围，以便更好地查看
    else if size(X, 2) >= 3							% 画曲线的情况
        u = linspace(-1, 1.5, 50);					% 设置网格范围
        v = linspace(-1, 1.5, 50);
        z = zeros(length(u), length(v));			% 初始化二维数组
        for i = 1:length(u)
            for j = 1:length(v)
                z(i,j) = mapFeature(u(i), v(j))*theta;	% 计算映射特性的拟合结果
            end
        end
        z = z'; 						% 在调用轮廓之前需转置z
        % 在指定范围[0,0]中画轮廓 即以0为分界画出一条等高线，也可以使用[0, 0.5,1]，画出3条，更明细区分
        contour(u, v, z, [0, 0], 'LineWidth', 2)
   end
   hold off;
end
