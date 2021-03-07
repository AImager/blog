%% envelope.m

function envelope(x,y,interpMethod)

% ENVELOPE gets the data of upper and down envelope of the known input (x,y).
%
% Input parameters:
%   x               the abscissa of the given data
%   y               the ordinate of the given data
%   interpMethod    the interpolation method
%
% Output parameters:
%   up      the upper envelope, which has the same length as x.
%   down    the down envelope, which has the same length as x.


flag = 1;
base_x = x;
base_y = y;



if (length(x) ~= length(y))
    error('Two input data should have the same length.');
end

if (nargin < 2 || nargin > 3)
    error('Please see help for INPUT DATA.');
elseif (nargin == 2)
    interpMethod = 'linear';
end




% find all extreme value
% ---------------------------------------------
extrMaxIndex = extrMaxFun(y);
extrMaxIndex = [1;extrMaxIndex;length(y)];
extrMaxIndex = unique(extrMaxIndex);
y_max = y(extrMaxIndex);
x_max = x(extrMaxIndex);

extrMinIndex = extrMinFun(y);
extrMinIndex = [1;extrMinIndex;length(y)];
extrMinIndex = unique(extrMinIndex);
y_min = y(extrMinIndex);
x_min = x(extrMinIndex);






% init
% ---------------------------------------------
prev_up_x = x_max;
prev_up_y = y_max;

prev_down_x = x_min;
prev_down_y = y_min;

prev_up_interp = interp1(prev_up_x,prev_up_y,x,interpMethod);
prev_down_interp = interp1(prev_down_x,prev_down_y,x,interpMethod);

[~, prev_balance] = judgeFun(base_x, base_y, prev_up_interp, prev_down_interp, length(prev_up_x), 100000000000000000);


while flag
  [curr_up_x,curr_up_y] = filterMaxFun(prev_up_x,prev_up_y);
  [curr_down_x,curr_down_y] = filterMinFun(prev_down_x,prev_down_y);
    
  % Interpolation of the upper/down envelope data
  % ----------------------------------------------------
  curr_up_interp = interp1(curr_up_x,curr_up_y,x,interpMethod);
  curr_down_interp = interp1(curr_down_x,curr_down_y,x,interpMethod);
  
  
  [flag, prev_balance] = judgeFun(base_x, base_y, curr_up_interp, curr_down_interp, length(curr_up_x), prev_balance);
  %flag = input('input 1 to iterate, input 0 to stop iterateֹ\n');
  
  if flag == 0
    figure;
    plot(x,y,'g-');
    hold on;
    plot(x,prev_up_interp,'r-');
    plot(x,prev_down_interp,'r-');
    axis([min(x),max(x),min(y)-range(y)*0.3,max(y)+range(y)*0.3]);
    %title('The envelope vs the given signal data','FontSize',18);
    set(gcf,'color',[250/255 250/255 250/255]); %设置figure背景色为无
    set(gca,'color',[250/255 250/255 250/255]); %设置坐标轴背景色为无
    hh = polyfit(x,y,1);
    testy = hh(1)*x+hh(2);
    plot(x,testy,'b-');
    testyy = (prev_up_interp +prev_down_interp)/2;
    plot(x,testyy,'black-');
    legend({'波形图','上包络','下包络','线性拟合曲线','中位线'},'Location','northoutside','Orientation','horizontal','FontSize',26);
    
   	%set(gcf,'color','none');
    hold off;
    
    %imwrite(p,'图像名.png','Alpha',0)
  else
    prev_up_x = curr_up_x;
    prev_down_x = curr_down_x;
    prev_up_y = curr_up_y;
    prev_down_y = curr_down_y;
    prev_up_interp = curr_up_interp;
    prev_down_interp = curr_down_interp;
  end
  
end



