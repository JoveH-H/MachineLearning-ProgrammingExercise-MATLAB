function word_indices = processEmail(email_contents)
    vocabList = getVocabList();						% ��ȡ�ʻ��б�
    word_indices = [];
    email_contents = lower(email_contents);		% �ַ�תСд
    email_contents = regexprep(email_contents, '<[^<>]+>', ' '); 			% �ַ��滻
    email_contents = regexprep(email_contents, '[0-9]+', 'number');
    email_contents = regexprep(email_contents, '(http|https)://[^\s]*', 'httpaddr');
    email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
    email_contents = regexprep(email_contents, '[$]+', 'dollar');
    l = 0;												% ���ַ�������ʼ��
    fprintf('\n==== Processed Email ====\n\n');	% ��ʾԤ������ʼ�
    while ~isempty(email_contents)					% �ж��ı��Ƿ�Ϊ��
        [str, email_contents] = ...					% ���ı��ı����š����кͻس��Ƴ���str��
            strtok(email_contents,[' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
        str = regexprep(str, '[^a-zA-Z0-9]', '');	% ɾ���κη���ĸ�����ַ�
        try str = porterStemmer(strtrim(str)); 	% ����Ӣ�ķִʣ�������porterStemmer.m��
        catch str = ''; continue;				% ʹ�ÿո�ָ�����
        end;
        if length(str) < 1							% �������̫�̣�������
            continue;
        end
        for i=1:length(vocabList)					% ��ȡ�ֵ䳤�ȣ��ʻ�����
            if strcmp(str, vocabList{i})==1			% ���ֵ��в��ҵ��ʲ���ӵ�Ŀ¼������
                word_indices=[word_indices;i];
            end
        end
        if (l + length(str) + 1) > 78				% ȷ��ÿ�����������78���ַ�
            fprintf('\n');								% ��ӻ��з�
            l = 0;										% ���ַ���������
        end
        fprintf('%s ', str);							% ��ʾ�ı�
        l = l + length(str) + 1;						% ���ַ���������
    end
    fprintf('\n\n=========================\n');
end
