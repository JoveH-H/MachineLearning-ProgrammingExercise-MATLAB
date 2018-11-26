function visualizeFit(X, mu, sigma2)
    [X1,X2] = meshgrid(0:.5:35); 				% 返回二维网格坐标
    Z = multivariateGaussian([X1(:) X2(:)],mu,sigma2); % 计算数据多元高斯分布的概率密度
    Z = reshape(Z,size(X1));						% 重组概率密度数组
    plot(X(:, 1), X(:, 2),'bx');				% 绘制数据
    hold on;										% 保留当前坐标区中的绘图
    if (sum(isinf(Z)) == 0)						% 如果有不定式就不要作图
        contour(X1, X2, Z, 10.^(-20:3:0)');		% 绘制等高线
    end
    hold off;										% 关闭绘图保持
end
