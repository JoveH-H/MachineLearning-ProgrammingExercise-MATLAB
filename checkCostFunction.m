function checkCostFunction(lambda)
    if ~exist('lambda', 'var') || isempty(lambda)
        lambda = 0;									% 设置正则化默认值
    end
    X_t = rand(4, 3);                               % 创建一些协同小数据
    Theta_t = rand(5, 3);
    Y = X_t * Theta_t';
    Y(rand(size(Y)) > 0.5) = 0;						% 删除大的数据
    R = zeros(size(Y));								% 获取评价标签
    R(Y ~= 0) = 1;
    X = randn(size(X_t));							% 初始化随机模拟电影特征
    Theta = randn(size(Theta_t));					% 初始化随机模拟拟合参数
    num_users = size(Y, 2);							% 获取观众数量
    num_movies = size(Y, 1);						% 获取电影数量
    num_features = size(Theta_t, 2);				% 获取电影特征
    numgrad = computeNumericalGradient(@(t) cofiCostFunc(t, Y, R, num_users, ...
        num_movies, num_features, lambda), [X(:); Theta(:)]);
    [cost, grad] = cofiCostFunc([X(:); Theta(:)],  Y, R, num_users, ...
        num_movies, num_features, lambda);
    disp([numgrad grad]);							% 显示模拟梯度和数据梯度
    diff = norm(numgrad-grad)/norm(numgrad+grad);	% 计算梯度偏差
    fprintf('Relative Difference: %g\n', diff);   % 显示梯度偏差（应小于1e-9）
end
