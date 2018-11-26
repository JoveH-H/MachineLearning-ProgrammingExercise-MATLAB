function [bestEpsilon bestF1] = selectThreshold(yval, pval)
    bestEpsilon = 0;									% 初始化最佳阀值
    bestF1 = 0;										% 初始化最佳F值
    F1 = 0;											% 初始化F值
    stepsize = (max(pval) - min(pval)) / 1000;	% 初始化计算1000步
    for epsilon = min(pval):stepsize:max(pval)
        predictions = (pval < epsilon);
        tp = sum((predictions == 1)&(yval == 1));	% 计算真阳性
        fp = sum((predictions == 0)&(yval == 1));	% 计算假阳性
        fn = sum((predictions == 1)&(yval == 0));	% 计算真阴性
        prec = tp/(tp + fp);							% 查准率
        rec = tp/(tp + fn);							% 召回率
        F1 = 2*prec*rec/(prec + rec);				% 计算F值
        if F1 > bestF1									% 获取最佳F值
            bestF1 = F1;
            bestEpsilon = epsilon;
        end
    end
end
