---
title: matlab
layout: wiki
category: 30 minutes
tag: [matlab]
---

## 常用全局变量

~~~Matlab
eps		//无穷小
realmax	//最大实数
realmin	//最小实数
pi		//π
inf		//无穷大
NaN		//未知量
i		//复数符号
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
exp(1)			//返回常量e
~~~

## 画图函数

~~~Matlab
plot
ezplot
ezplot3
ezsurf
ezmesh
ezmeshc
axis		//调整当前图像的坐标轴的各个属性
gcf			//当前图像的画布背景句柄
gca			//当前图像的画布句柄
~~~



## 数学函数

~~~Matlab
/*初等数学*/
rem(A,B)	//取余
mod(A,B)	//取模
var			//求方差
solve		//方程求解
ezsolve		//解符号方程
fsolve		//解非线性方程


/*多项式*/
polyval(A,B)	//将系数向量A代表的多项式中的x用B值代入得到函数值
polyvalm(A,B)	//将系数向量A代表的多项式中的x用B矩阵代入(矩阵运算)得到函数值
deconv(A,B)		//多项式相除
collect(S)		//合并同类项


/*矩阵行列式*/
rec			//解递推方程
corrcoef	//相关系数的计算
eig			//特征值和特征向量计算


/*微积分与极限*/
int			//积分运算
dsolve		//解微分方程
quad		//数值句柄积分
fzero
limit		//求极限
taylor		//求泰勒展开式
inline(‘f(x)’,‘x’)		//创建内联函数，即得到可直接调用h(t)
trapz		//数值积分
expand		//对指定项展开
evalin
diff		//微分
~~~
