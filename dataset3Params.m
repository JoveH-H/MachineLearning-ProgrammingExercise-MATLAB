function [C, sigma] = dataset3Params(X, y, Xval, yval)
    wid=[0.01;0.03;0.1;0.3;1;3;10;30];		% ��ʼ����ͬ���򻯲����ͱ�׼���
    for i=1:size(wid,1)
        for j=1:size(wid,1)
            % ����SVMѵ������������ǩ�����򻯲�������˹�˺�����Ĭ�Ϲ���ֵ0.001��Ĭ������������5
            model= svmTrain(X, y, wid(i), @(x1, x2) gaussianKernel(x1, x2, wid(j)));
            predictions= predictNolinearaBility(model, Xval);	% ���ݽ�����֤����Ͻ��
            errors(i,j)=mean(double(predictions ~= yval));	% �ȽϽ�����֤����Ͻ��
        end
    end
    [i,j]=find(errors==min(min(errors)));						% ѡ���������͵Ĳ���
    C = median(wid(i));
    sigma = median(wid(j));
end
