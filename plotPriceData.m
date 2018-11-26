function plotPriceData(x, y)
    figure; 								% 打开一个新的图形窗口
    plot(x, y, 'rx', 'MarkerSize', 10); 	% 绘制数据 ‘红色X型’ ‘方框’ ‘大小为10’
    ylabel('Profit in $10,000s'); 			% 设置y轴标签
    xlabel('Population of City in 10,000s');
end
