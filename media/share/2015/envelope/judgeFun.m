%% judgeFun.m

function [flag, curr_balance] = judgeFun(base_x, base_y, up_interp, down_interp, curr_length, prev_balance)

coeff = polyfit(base_x,base_y,1);
aver_inter = (up_interp+down_interp)/2;
aver_y = coeff(1) * base_x + coeff(2);

curr_balance = mean(abs(aver_inter-aver_y))*curr_length;

if prev_balance > curr_balance
  flag = 1;
else
  flag = 0;
end
