function W = randInitializeWeights(fan_out, fan_in)
	% 经验σ：epsilon_init=sqrt(6)/sqrt(L_in+L_out) L_in=sl & L_out=sl+1
	epsilon_init = sqrt(6)/sqrt(fan_in+fan_out);
    % 初始化较小的值 [-σ,σ]
    W = rand(fan_in, fan_out + 1) * 2 * epsilon_init - epsilon_init;
end
