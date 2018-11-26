clear ; close all; clc				% ������ݺͽ���
load ('movieEvaluation.mat');		% ����movieEvaluation.mat��1682����Ӱ������Y (1682*943double)
                                    % ����943���������۵ĵ�Ӱ(1682*943double)
AverageRating=mean(Y(1, R(1, :)));	% ��Ӱ��ƽ�����ۣ�1-5��
imagesc(Y);							% ��ʾ����
ylabel('Movies');					% ����x��y�����
xlabel('Users');						
checkCostFunction(1.5);						% ���Эͬ�����ݶȣ����򻯲���1.5
movieList = loadMovieList();				% ���ص�Ӱ�б�(1682*1cell)
my_ratings = zeros(1682, 1);				% ��ʼ���Լ��ĵ�Ӱ�����б�
my_ratings(98) = 2; 						% ����һЩ��Ӱ
my_ratings(7) = 3;
my_ratings(66)= 3;
my_ratings(1) = 4;
my_ratings(54) = 4;
my_ratings(183) = 4;
my_ratings(12)= 5;
my_ratings(64)= 5;
my_ratings(226) = 5;
my_ratings(355)= 5;
my_ratings(69) = 5;
Y = [my_ratings Y];							% �������������
R = [(my_ratings ~= 0) R];
[Ynorm, Ymean] = normalizeRatings(Y, R);	% ��������
num_users = size(Y, 2);						% ��ȡ��������943+1
num_movies = size(Y, 1);					% ��ȡ��Ӱ����1682
num_features = 10;							% ��ȡ��Ӱ����
X = randn(num_movies, num_features);		% ��ʼ�������Ӱ����
Theta = randn(num_users, num_features);     % ��ʼ�������ϲ���
initial_parameters = [X(:); Theta(:)];		% ���ϳ�ʼ����
options = optimset('GradObj', 'on', 'MaxIter', 100);	% ʹ���Զ�����ݶ��½���ʽ������100��
lambda = 0.16;								% �������򻯲���0.16
theta = fmincg (@(t)(cofiCostFunc(t, Ynorm, R, num_users, num_movies, ...
          num_features, lambda)), initial_parameters, options);	 % ���д��ۺ�����Сֵ�Ż�
% ���²���
X = reshape(theta(1:num_movies*num_features), num_movies, num_features);	
Theta = reshape(theta(num_movies*num_features+1:end), num_users, num_features);
p = X * Theta';								% ��ȡ�����������
my_predictions = p(:,1) + Ymean;			% ��ȡ�������
[r, ix] = sort(my_predictions, 'descend');  % �������У��õ�������(��������)r�����(��Ӱ����)ix
for i=1:10										
    j = ix(i);								% ��ȡԤ����������ǰ10�ĵ�Ӱ���
    % ��ʾԤ������ǰʮ�����ֺͶ�Ӧ�ĵ�Ӱ
    fprintf('Predicting rating %.1f for movie %s\n', my_predictions(j), movieList{j});
end

