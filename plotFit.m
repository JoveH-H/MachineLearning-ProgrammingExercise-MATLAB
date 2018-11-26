function plotFit(min_x, max_x, mu, sigma, theta, p)
    hold on;										% 保留当前坐标区中的绘图
    x = (min_x - 15: 0.05 : max_x + 25)';			% 0.05步均分输入X的范围
    X_poly = polyFeatures(x, p);					% 多项式映射
    X_poly = bsxfun(@minus, X_poly, mu);			% X和平均数两个数组间元素逐个相减
    X_poly = bsxfun(@rdivide, X_poly, sigma);		% X和标准差两个数组间元素逐个左除
    X_poly = [ones(size(x, 1), 1) X_poly];			% 添加偏置单元
    plot(x, X_poly * theta, '--', 'LineWidth', 2)	% 绘制拟合曲线
    hold off
end
