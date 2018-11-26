function movieList = loadMovieList()
    fid = fopen('movie_ids.txt');	% 加载movie_ids.txt的编号 名称(年份)
    n = 1682;						% 样本电影数量
    movieList = cell(n, 1);			% 初始化电影列表
    for i = 1:n
        line = fgets(fid);			% 初始化电影列表
        [idx, movieName] = strtok(line, ' ');	% 获取编号和名称(年份)，空格前为编号
        movieList{i} = strtrim(movieName);		% 获取电影名称(年份)
    end
    fclose(fid);					% 关闭movie_ids.txt
end
