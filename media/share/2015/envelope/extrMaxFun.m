%% extrMaxFun.m
% find extreme max value
% ---------------------------------------------

function index = extrMaxFun(y)
n = length(y);
index = zeros(n,1);
k = 1;
for i = 2:n-1
  if (y(i-1)<=y(i) && y(i+1)<=y(i) && y(i-1) ~= y(i+1)) || (y(i-1)<y(i) && y(i+1)<y(i))
    index(k) = i;
    k = k + 1;
  end
end
index(index == 0) = [];