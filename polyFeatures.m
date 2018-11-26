function [X_poly] = polyFeatures(X, p)
    X_poly = zeros(size(X,1), p);		% ��ʼ����������12*8 double
    for i=1:p
        X_poly(:,i)=X .^ i;				% ����[X(i) , X(i).^2,  X(i).^3, ... , X(i).^p]
    end
end
