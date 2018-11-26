function [C, sigma] = dataset3Params(X, y, Xval, yval)
    wid=[0.01;0.03;0.1;0.3;1;3;10;30];		% 初始化不同正则化参数和标准差σ
    for i=1:size(wid,1)
        for j=1:size(wid,1)
            % 设置SVM训练：特征，标签，正则化参数，高斯核函数，默认公差值0.001，默认最大迭代次数5
            model= svmTrain(X, y, wid(i), @(x1, x2) gaussianKernel(x1, x2, wid(j)));
            predictions= predictNolinearaBility(model, Xval);	% 根据交叉验证集拟合结果
            errors(i,j)=mean(double(predictions ~= yval));	% 比较交叉验证集拟合结果
        end
    end
    [i,j]=find(errors==min(min(errors)));						% 选择错误率最低的参数
    C = median(wid(i));
    sigma = median(wid(j));
end
