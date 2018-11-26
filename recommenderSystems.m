clear ; close all; clc				% 清除数据和界面
load ('movieEvaluation.mat');		% 加载movieEvaluation.mat的1682部电影的评价Y (1682*943double)
                                    % 加载943名观众评价的电影(1682*943double)
AverageRating=mean(Y(1, R(1, :)));	% 电影的平均评价（1-5）
imagesc(Y);							% 显示评价
ylabel('Movies');					% 设置x，y轴标题
xlabel('Users');						
checkCostFunction(1.5);						% 检查协同过滤梯度，正则化参数1.5
movieList = loadMovieList();				% 加载电影列表(1682*1cell)
my_ratings = zeros(1682, 1);				% 初始化自己的电影评价列表
my_ratings(98) = 2; 						% 评价一些电影
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
Y = [my_ratings Y];							% 添加新评价数据
R = [(my_ratings ~= 0) R];
[Ynorm, Ymean] = normalizeRatings(Y, R);	% 正则化评价
num_users = size(Y, 2);						% 获取观众数量943+1
num_movies = size(Y, 1);					% 获取电影数量1682
num_features = 10;							% 获取电影特征
X = randn(num_movies, num_features);		% 初始化随机电影特征
Theta = randn(num_users, num_features);     % 初始化随机拟合参数
initial_parameters = [X(:); Theta(:)];		% 整合初始参数
options = optimset('GradObj', 'on', 'MaxIter', 100);	% 使用自定义的梯度下降公式，迭代100次
lambda = 0.16;								% 设置正则化参数0.16
theta = fmincg (@(t)(cofiCostFunc(t, Ynorm, R, num_users, num_movies, ...
          num_features, lambda)), initial_parameters, options);	 % 进行代价函数最小值优化
% 更新参数
X = reshape(theta(1:num_movies*num_features), num_movies, num_features);	
Theta = reshape(theta(num_movies*num_features+1:end), num_users, num_features);
p = X * Theta';								% 获取正则化拟合评价
my_predictions = p(:,1) + Ymean;			% 获取拟合评价
[r, ix] = sort(my_predictions, 'descend');  % 降序排列，得到新数组(评分排名)r和序号(电影排名)ix
for i=1:10										
    j = ix(i);								% 获取预测评分排名前10的电影编号
    % 显示预测排名前十的评分和对应的电影
    fprintf('Predicting rating %.1f for movie %s\n', my_predictions(j), movieList{j});
end

