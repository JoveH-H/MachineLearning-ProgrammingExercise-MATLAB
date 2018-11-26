function file_contents = readFile(filename)
    fid = fopen(filename);							% 打开文本文件
    if fid											% 存在文本文件
        file_contents = fscanf(fid, '%c', inf);     % 复制文本
        fclose(fid);								% 关闭文本文件
    else											% 不存在文本文件
        file_contents = '';							% 文本为空
        fprintf('Unable to open %s\n', filename); 	% 提示无法打开文件
    end
end
