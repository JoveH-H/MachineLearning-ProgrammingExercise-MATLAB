function word_indices = processEmail(email_contents)
    vocabList = getVocabList();						% 获取词汇列表
    word_indices = [];
    email_contents = lower(email_contents);		% 字符转小写
    email_contents = regexprep(email_contents, '<[^<>]+>', ' '); 			% 字符替换
    email_contents = regexprep(email_contents, '[0-9]+', 'number');
    email_contents = regexprep(email_contents, '(http|https)://[^\s]*', 'httpaddr');
    email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
    email_contents = regexprep(email_contents, '[$]+', 'dollar');
    l = 0;												% 行字符计数初始化
    fprintf('\n==== Processed Email ====\n\n');	% 显示预处理的邮件
    while ~isempty(email_contents)					% 判断文本是否为空
        [str, email_contents] = ...					% 将文本的标点符号、换行和回车移除到str中
            strtok(email_contents,[' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
        str = regexprep(str, '[^a-zA-Z0-9]', '');	% 删除任何非字母数字字符
        try str = porterStemmer(strtrim(str)); 	% 尝试英文分词，函数在porterStemmer.m中
        catch str = ''; continue;				% 使用空格分隔单词
        end;
        if length(str) < 1							% 如果单词太短，就跳过
            continue;
        end
        for i=1:length(vocabList)					% 获取字典长度，词汇数量
            if strcmp(str, vocabList{i})==1			% 在字典中查找单词并添加到目录数组中
                word_indices=[word_indices;i];
            end
        end
        if (l + length(str) + 1) > 78				% 确保每行输出不多余78个字符
            fprintf('\n');								% 添加换行符
            l = 0;										% 行字符计数清零
        end
        fprintf('%s ', str);							% 显示文本
        l = l + length(str) + 1;						% 行字符计数叠加
    end
    fprintf('\n\n=========================\n');
end
