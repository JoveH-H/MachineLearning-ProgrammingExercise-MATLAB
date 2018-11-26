function movieList = loadMovieList()
    fid = fopen('movie_ids.txt');	% ����movie_ids.txt�ı�� ����(���)
    n = 1682;						% ������Ӱ����
    movieList = cell(n, 1);			% ��ʼ����Ӱ�б�
    for i = 1:n
        line = fgets(fid);			% ��ʼ����Ӱ�б�
        [idx, movieName] = strtok(line, ' ');	% ��ȡ��ź�����(���)���ո�ǰΪ���
        movieList{i} = strtrim(movieName);		% ��ȡ��Ӱ����(���)
    end
    fclose(fid);					% �ر�movie_ids.txt
end
