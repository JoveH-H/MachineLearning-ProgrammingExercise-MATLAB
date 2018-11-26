function [h, display_array] = display2DGrayData(X, example_width)
    % 如果没有传入，则自动设置example_width
    if ~exist('example_width', 'var') || isempty(example_width)
        example_width = round(sqrt(size(X, 2)));
    end
    colormap(gray); 						% 输出一个灰色系的曲面图
    [m n] = size(X);						% 计算输入数组X的行和列数
    example_height = (n / example_width); 	% 计算2D数据的高度和宽度
    display_rows = floor(sqrt(m));			% 计算显示高度和宽度
    display_cols = ceil(m / display_rows);
    pad = 1;                                % 设置像素间距
    display_array = - ones(pad + display_rows * (example_height + pad), ...
        pad + display_cols * (example_width + pad));	% 设置空白显示
    curr_ex = 1;
    for j = 1:display_rows
        for i = 1:display_cols
            if curr_ex > m,
                break;
            end
            max_val = max(abs(X(curr_ex, :))); % 求出此样本的最大值，使赋予display_array的值小于1
            display_array(pad + (j - 1) * (example_height + pad)+(1:example_height), ...
                pad + (i - 1) * (example_width + pad)+(1:example_width)) = ...
                reshape(X(curr_ex, :), example_height, example_width)/max_val;
            curr_ex = curr_ex + 1;
        end
        if curr_ex > m,
            break;
        end
    end
    h = imagesc(display_array, [-1 1]); 				% 显示灰度值位于±1中之间的图像
    axis image off 										% 设置不显示轴
    drawnow;											% 更新图窗并处理回调
end
