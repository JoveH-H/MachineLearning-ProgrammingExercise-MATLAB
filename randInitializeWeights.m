function W = randInitializeWeights(fan_out, fan_in)
	% ����ң�epsilon_init=sqrt(6)/sqrt(L_in+L_out) L_in=sl & L_out=sl+1
	epsilon_init = sqrt(6)/sqrt(fan_in+fan_out);
    % ��ʼ����С��ֵ [-��,��]
    W = rand(fan_in, fan_out + 1) * 2 * epsilon_init - epsilon_init;
end
