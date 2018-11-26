function file_contents = readFile(filename)
    fid = fopen(filename);							% ���ı��ļ�
    if fid											% �����ı��ļ�
        file_contents = fscanf(fid, '%c', inf);     % �����ı�
        fclose(fid);								% �ر��ı��ļ�
    else											% �������ı��ļ�
        file_contents = '';							% �ı�Ϊ��
        fprintf('Unable to open %s\n', filename); 	% ��ʾ�޷����ļ�
    end
end
