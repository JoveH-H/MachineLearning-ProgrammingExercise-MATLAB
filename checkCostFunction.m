function checkCostFunction(lambda)
    if ~exist('lambda', 'var') || isempty(lambda)
        lambda = 0;									% ��������Ĭ��ֵ
    end
    X_t = rand(4, 3);                               % ����һЩЭͬС����
    Theta_t = rand(5, 3);
    Y = X_t * Theta_t';
    Y(rand(size(Y)) > 0.5) = 0;						% ɾ���������
    R = zeros(size(Y));								% ��ȡ���۱�ǩ
    R(Y ~= 0) = 1;
    X = randn(size(X_t));							% ��ʼ�����ģ���Ӱ����
    Theta = randn(size(Theta_t));					% ��ʼ�����ģ����ϲ���
    num_users = size(Y, 2);							% ��ȡ��������
    num_movies = size(Y, 1);						% ��ȡ��Ӱ����
    num_features = size(Theta_t, 2);				% ��ȡ��Ӱ����
    numgrad = computeNumericalGradient(@(t) cofiCostFunc(t, Y, R, num_users, ...
        num_movies, num_features, lambda), [X(:); Theta(:)]);
    [cost, grad] = cofiCostFunc([X(:); Theta(:)],  Y, R, num_users, ...
        num_movies, num_features, lambda);
    disp([numgrad grad]);							% ��ʾģ���ݶȺ������ݶ�
    diff = norm(numgrad-grad)/norm(numgrad+grad);	% �����ݶ�ƫ��
    fprintf('Relative Difference: %g\n', diff);   % ��ʾ�ݶ�ƫ�ӦС��1e-9��
end
