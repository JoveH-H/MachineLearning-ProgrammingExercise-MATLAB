clear ; close all; clc				% ������ݺͽ���
load ('simulationData.mat');		% ����simulationData.mat��ѵ������X(12*1double), y(12*1double)
                                    % ���ز�������X_test (21*1double), y_test (21*1double)
                                    % ���ؽ�����֤����X_val (21*1double), y_val (21*1double)
m = size(X, 1);						% ��ȡ�������� 12
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);   % ��ʾ��С10���ߴ�1.5��ɫX���ʾX,y��ϵ
xlabel('Change in water level (x)');                    % ����x���ǩ
ylabel('Water flowing out of the dam (y)');
lambda = 0;												% �������򻯲���
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);	% ѵ�����Իع��ȡ������ϲ���
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);   % ��ʾ��С10���ߴ�1.5��ɫX���ʾX,y��ϵ
xlabel('Change in water level (x)');					% ����x���ǩ
ylabel('Water flowing out of the dam (y)');
hold on;												% ������ǰ�������еĻ�ͼ
plot(X, [ones(m, 1) X]*theta, '--', 'LineWidth', 2)     % �����������
hold off;
[error_train,error_val]= ...                            % ��ȡѵ���Ĵ��ۺͽ�����֤�Ĵ���
	learningCurve([ones(m,1) X],y,[ones(size(Xval,1),1) Xval], yval,lambda);	
figure;                                                 % ���µĻ��ƴ���
plot(1:m, error_train, 1:m, error_val);	% ���������������仯��ѵ���ͽ�����֤�Ĵ��۱仯����
title('Learning curve for linear regression')			% ���ñ���
legend('Train', 'Cross Validation')                     % ����ͼ��
xlabel('Number of training examples')					% ����x���ǩ
ylabel('Error')											
axis([0 13 0 150])										% ����x��y�᷶Χ
p = 8;													% ���ö���ʽ��ߴη�
X_poly = polyFeatures(X, p);							% ���ö�������12*8 double
[X_poly, mu, sigma] = featureNormalize(X_poly);  		% ��ֵ��һ����������
X_poly = [ones(m, 1), X_poly];                   		% ���ƫ�õ�Ԫ��������12*9 double
X_poly_val = polyFeatures(Xval, p);                     % ���öཻ����֤������21*8 double
X_poly_val = bsxfun(@minus, X_poly_val, mu);			% ��ֵ����ʹ��ѵ������ƽ��ֵ
X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);	% ��һ����ʹ��ѵ�����ı�׼��
X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];	% ���ƫ�õ�Ԫ��������21*9 double 
X_poly_test = polyFeatures(Xtest, p);					% ���ö����������21*8 double
X_poly_test = bsxfun(@minus, X_poly_test, mu);          % ��ֵ����ʹ��ѵ������ƽ��ֵ
X_poly_test = bsxfun(@rdivide, X_poly_test, sigma); 	% ��һ����ʹ��ѵ�����ı�׼��
X_poly_test = [ones(size(X_poly_test,1), 1), X_poly_test];  % ���ƫ�õ�Ԫ��������21*9 double
lambda = 1;													% �������򻯲������˴����ſ��޸ģ�
[theta] = trainLinearReg(X_poly, y, lambda);				% ѵ�����Իع�
figure;														% �������ݺ��������
plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);       % ����X, y�Ĺ�ϵ
plotFit(min(X), max(X), mu, sigma, theta, p);				% ������϶���ʽ����
xlabel('Change in water level (x)');						% ����x���ǩ
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));	% ���ñ���
figure;														% ���ƶ������͸ߴζ���ʽ��ѧϰ����
[error_train, error_val] = learningCurve(X_poly, y, X_poly_val, yval, lambda);
plot(1:m, error_train, 1:m, error_val);					
title(sprintf('Polynomial Regression Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')						% ����x���ǩ
ylabel('Error')												
axis([0 13 0 100])											% ����x��y�᷶Χ
legend('Train', 'Cross Validation')                         % ����ͼ��

% ��ȡ��ͬ�����򻯲���ʱ��ѧϰ��������
[lambda_vec, error_train, error_val] = validationCurve(X_poly, y, X_poly_val, yval);
% ���Ʋ�ͬ�����򻯲���ʱ��ѵ���ͽ�����֤���۵ı仯����
figure;                                                 % ���µĻ��ƴ���
plot(lambda_vec, error_train, lambda_vec, error_val); 
legend('Train', 'Cross Validation');					% ����ͼ��
xlabel('lambda');										% ����x��y�����
ylabel('Error');

