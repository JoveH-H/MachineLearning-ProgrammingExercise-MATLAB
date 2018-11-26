function p = predictOneVsAll(all_theta, X)
    [maxx,p]=max(X*all_theta',[],2);	% 计算拟合输入，即每行的参数对应某标签的假设函数的输入
    % 获取每一行的[最大值，最大值列数] 
end
