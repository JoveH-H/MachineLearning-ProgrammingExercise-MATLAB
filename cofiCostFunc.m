function [J, grad] = cofiCostFunc(params,Y,R,num_users,num_movies,num_features,lambda)
	% 获取参数
    X = reshape(params(1:num_movies*num_features), num_movies, num_features);
    Theta = reshape(params(num_movies*num_features+1:end), num_users, num_features);
    predict=(X*Theta') .* R;								% 预测评分
    % 预测代价
    J=1/2*sum(sum((predict-Y).^2))+lambda/2*sum(sum(Theta.^2))+lambda/2*sum(sum(X.^2));
    X_grad = (X*Theta'-Y).*R*Theta + lambda*X;              % 更新特征电影评分X梯度
    Theta_grad = ((X*Theta'-Y).*R)'*X + lambda*Theta;       % 更新特征观众评分Theta梯度
    grad = [X_grad(:); Theta_grad(:)];                      % 整合偏导数
end
