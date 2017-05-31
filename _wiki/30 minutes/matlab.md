---
title: matlab
layout: wiki
category: 30 minutes
tag: [matlab]
---

## 常用全局变量

~~~Matlab
% 无穷小
eps

% 最大实数
realmax

% 最小实数
realmin

% π
pi

% 无穷大
inf

% 未知量
NaN

% 复数符号
i
~~~


## 初始化函数

~~~Matlab
initvar = i:j:k
hilb(n)
invhilb(n)
linspace(a,b,n)
logspace(a,b,n)
magic(n)
ones(m,n)
zeros(m,n)
eye(m,n)
rand(m,n)
randn(m,n)
randi([imax,imin],m,n)
pascal(n)

% 返回常量e
exp(1)
~~~

## 画图函数

~~~Matlab
plot
ezplot
ezplot3
ezsurf
ezmesh
ezmeshc

% 调整当前图像的坐标轴的各个属性
axis

% 当前图像的画布背景句柄
gcf

% 当前图像的画布句柄
gca
~~~



## 数学函数


### 初等数学

~~~Matlab
% 取余
rem(A,B)

% 取模
mod(A,B)

% 求方差
var

% 方程求解
solve

% 解符号方程
ezsolve

% 解非线性方程
fsolve
~~~

### 多项式

~~~Matlab
% 将系数向量A代表的多项式中的x用B值代入得到函数值
polyval(A,B)

% 将系数向量A代表的多项式中的x用B矩阵代入(矩阵运算)得到函数值
polyvalm(A,B)

% 多项式相除
deconv(A,B)

% 合并同类项
collect(S)
~~~

### 矩阵行列式

~~~Matlab
% 解递推方程
rec

% 相关系数的计算
corrcoef

% 特征值和特征向量计算
eig
~~~


### 微积分与极限

~~~Matlab
% 积分运算
int

% 解微分方程
dsolve

% 数值句柄积分
quad

fzero

% 求极限
limit

% 求泰勒展开式
taylor

% 创建内联函数，即得到可直接调用h(t)
inline(‘f(x)’,‘x’)

% 数值积分
trapz

% 对指定项展开
expand

evalin

% 差分
diff
~~~


## 时间函数

~~~Matlab
% 将时间戳住转换为字符串时间
datestr((timestamp-3600*24+8*3600)/86400 + 70*365+19, 'yy-mm-dd HH:MM:SS')
~~~