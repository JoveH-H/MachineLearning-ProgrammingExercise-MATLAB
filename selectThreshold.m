function [bestEpsilon bestF1] = selectThreshold(yval, pval)
    bestEpsilon = 0;									% ��ʼ����ѷ�ֵ
    bestF1 = 0;										% ��ʼ�����Fֵ
    F1 = 0;											% ��ʼ��Fֵ
    stepsize = (max(pval) - min(pval)) / 1000;	% ��ʼ������1000��
    for epsilon = min(pval):stepsize:max(pval)
        predictions = (pval < epsilon);
        tp = sum((predictions == 1)&(yval == 1));	% ����������
        fp = sum((predictions == 0)&(yval == 1));	% ���������
        fn = sum((predictions == 1)&(yval == 0));	% ����������
        prec = tp/(tp + fp);							% ��׼��
        rec = tp/(tp + fn);							% �ٻ���
        F1 = 2*prec*rec/(prec + rec);				% ����Fֵ
        if F1 > bestF1									% ��ȡ���Fֵ
            bestF1 = F1;
            bestEpsilon = epsilon;
        end
    end
end
