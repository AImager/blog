---
title: matlab
layout: wiki
category: tool
tag: [matlab]
---

## 常用全局变量

~~~matlab
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


## 格式转换

~~~matlab
% 使用常数计数法代替科学计数法
format long g

% cell数组转换为数值数组
cell2mat
~~~

## 初始化函数

~~~matlab
% 返回步长矩阵
initvar = i:j:k

% 返回全1矩阵
ones(m,n)

% 返回全0矩阵
zeros(m,n)

% 返回(0,1)随机数矩阵
rand(m,n)

% 返回常量e
exp(1)
~~~


## 时间函数

~~~matlab
% 将时间戳住转换为字符串时间
datestr((timestamp-3600*24+8*3600)/86400 + 70*365+19, 'yy-mm-dd HH:MM:SS')

% 将字符串转换为时间戳，东8时区
(datenum(str)-datenum('1970-01-01','yy-mm-dd'))*24*3600 - 8*3600

% 查看星期几
weekday('2017-06-01')

% 查看第几周
weeknum('2017-06-01')
~~~

## 画图函数

~~~matlab
% 基础画图函数
plot

% 调整当前图像的坐标轴的各个属性
axis

% 当前图像的画布背景句柄
gcf

% 当前图像的画布句柄
gca
~~~


## 数据库操作

~~~matlab
db = database('db','username','password','com.mysql.jdbc.Driver','jdbc:mysql://127.0.0.1:3306/db');
sql = 'select 1';
db_cur = exec(db, sql);
db_cur_fetch = fetch(db_cur); 
data = cell2mat(db_cur_fetch.data);
~~~


## 数学函数


### 初等数学

~~~matlab
% 取余
rem(A,B)

% 取模
mod(A,B)

% 向上取整
ceil(A)

% 差分
diff(A)

% 方程求解
solve(x^2 + 4*x + 1 == 0)
~~~

### 多项式

~~~matlab
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

~~~matlab
% 解递推方程
rec

% 相关系数的计算
corrcoef

% 特征值和特征向量计算
eig
~~~


### 微积分与极限

~~~matlab
% 积分运算
int

% 解微分方程
dsolve

% 数值句柄积分
quad

% 非线性方程求根
fzero

% 求极限
limit

% 求泰勒展开式
taylor

% 创建内联函数，即得到可直接调用h(t)
inline(‘f(x)’,‘x’)

% 数值积分
trapz
~~~

### 集合

~~~matlab
% 求A和B的差集A-B
setdiff(A,B);

% 取交集
% res1表示交集值
% res2表示A与B交集后在A中的位置
% res3表示A与B交集后在B中的位置
[res1, res2, res3] = intersect(A,B);
~~~


### 统计

~~~matlab
% 统计arr里1:7每个数的个数
% 如果不进行返回值赋值，就是画图函数
ans = hist([2,1,2,5,1],1:7);

% 若arr全为正整数，统计[1:max(arr)]每个数的个数和占比
% 若arr中存在非正整数，统计每个元素的个数和占比
tabulate(arr)
~~~

