function [X_poly] = polyFeatures(X, p)
    X_poly = zeros(size(X,1), p);		% 初始化多特征集12*8 double
    for i=1:p
        X_poly(:,i)=X .^ i;				% 设置[X(i) , X(i).^2,  X(i).^3, ... , X(i).^p]
    end
end
