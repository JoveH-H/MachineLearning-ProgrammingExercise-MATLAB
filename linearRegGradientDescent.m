function [theta, J_history, theta_history] = linearRegGradientDescent(X, y, theta, alpha, num_iters)
    [m, n] = size(X); 						% ��ȡ������������������
    J_history = zeros(num_iters, 1);		% ��ʼ�����ۣ��ɱ�����¼���� J__history Ϊ0
    theta_history = zeros(10,n);            % ��ʼ����ϲ�����¼���� theta_historyΪ0
    for iter = 1:num_iters					% ����
        theta = theta - alpha / m * X'* (X * theta - y);			% ͬʱ������ϲ���
        J_history(iter) = linearRegComputeCost(X, y, theta);        % ��¼ÿ�εĴ��ۣ��ɱ���
        if(rem(iter, num_iters/10)==0)								% ��¼10����ϲ���
            theta_history(iter,:) = theta;
        end
    end
end
