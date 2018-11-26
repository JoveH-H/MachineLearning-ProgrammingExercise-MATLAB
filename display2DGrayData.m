function [h, display_array] = display2DGrayData(X, example_width)
    % ���û�д��룬���Զ�����example_width
    if ~exist('example_width', 'var') || isempty(example_width)
        example_width = round(sqrt(size(X, 2)));
    end
    colormap(gray); 						% ���һ����ɫϵ������ͼ
    [m n] = size(X);						% ������������X���к�����
    example_height = (n / example_width); 	% ����2D���ݵĸ߶ȺͿ��
    display_rows = floor(sqrt(m));			% ������ʾ�߶ȺͿ��
    display_cols = ceil(m / display_rows);
    pad = 1;                                % �������ؼ��
    display_array = - ones(pad + display_rows * (example_height + pad), ...
        pad + display_cols * (example_width + pad));	% ���ÿհ���ʾ
    curr_ex = 1;
    for j = 1:display_rows
        for i = 1:display_cols
            if curr_ex > m,
                break;
            end
            max_val = max(abs(X(curr_ex, :))); % ��������������ֵ��ʹ����display_array��ֵС��1
            display_array(pad + (j - 1) * (example_height + pad)+(1:example_height), ...
                pad + (i - 1) * (example_width + pad)+(1:example_width)) = ...
                reshape(X(curr_ex, :), example_height, example_width)/max_val;
            curr_ex = curr_ex + 1;
        end
        if curr_ex > m,
            break;
        end
    end
    h = imagesc(display_array, [-1 1]); 				% ��ʾ�Ҷ�ֵλ�ڡ�1��֮���ͼ��
    axis image off 										% ���ò���ʾ��
    drawnow;											% ����ͼ��������ص�
end
