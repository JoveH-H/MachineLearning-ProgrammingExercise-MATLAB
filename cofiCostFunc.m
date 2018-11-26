function [J, grad] = cofiCostFunc(params,Y,R,num_users,num_movies,num_features,lambda)
	% ��ȡ����
    X = reshape(params(1:num_movies*num_features), num_movies, num_features);
    Theta = reshape(params(num_movies*num_features+1:end), num_users, num_features);
    predict=(X*Theta') .* R;								% Ԥ������
    % Ԥ�����
    J=1/2*sum(sum((predict-Y).^2))+lambda/2*sum(sum(Theta.^2))+lambda/2*sum(sum(X.^2));
    X_grad = (X*Theta'-Y).*R*Theta + lambda*X;              % ����������Ӱ����X�ݶ�
    Theta_grad = ((X*Theta'-Y).*R)'*X + lambda*Theta;       % ����������������Theta�ݶ�
    grad = [X_grad(:); Theta_grad(:)];                      % ����ƫ����
end
