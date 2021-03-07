%% filterMinFun.m
% filter extreme min value
% ------------------------------------

function [x,y]=filterMinFun(x,y)

i = 2;
while i < length(y)
  y_interp = y(i-1) + (x(i)-x(i-1))/(x(i+1)-x(i))*(y(i+1)-y(i));
  if y_interp < y(i)
    y(i) = [];
    x(i) = [];
  else
    i = i + 1;
  end
end

end