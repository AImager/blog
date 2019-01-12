---
layout: wiki
tags: [数论]
---

## 超越数与代数数

* 超越数：不是代数数的无理数
* 代数数：任何整系数多项式的复根，比如 $\pi$ 和 $e$


## 常见自然数

自然数，可以指正整数，也可以指非负整数。在数论中通常用前者，而集合论和计算机科学中多数使用后者。

* 平方数
* 立方数
* 素数
* 合数
* 完全数：所有真因子的的和刚好等于本身

## 常见素数

* 孪生素数
* 梅森素数
* 素数N元组
* $N^2+1$ 素数
* 正规素数
* 费马素数
* 伪素数：$a^{n-1} \equiv 1 (mod n)$ ，但n不是素数，则称n为基于a的伪素数
* 卡米歇尔数/强伪素数：完全满足费马小定理的结论，但是不是素数，比如561

## 定义

* $\varphi$ 函数/欧拉函数：小于x且与x互质的个数
* $e_p(a)$ ：使 $a^k \equiv 1(mod p)$ 成立的最小正整指数k，其中a与p互素
* 原根：具有最高次数 $e_p(g)=p-1$ 的数g称为p的原根
* 佩尔方程： $x^2-D*y^2=1$
* 二次剩余(QR)：若 $a^2 \equiv b (mod p)$ ，且 $a(0<=a<p)$ ，则称b为p的二次剩余
* 二次非剩余(NR)：若 $x^2 \equiv b(mod p)$ 在 $(0,p)$ 中无解，则称b为p的二次非剩余
* 勒让德符号

$$
\left ( \frac{a}{p} \right )=\left\{\begin{matrix}
0 & a \equiv 0 (mod p) \\
-1 & 不存在整数x，使x^2 \equiv a (mod p) \\
+1 & a \not\equiv 0 (mod p) \\
  & 且存在整数x，使x^2 \equiv a (mod p)
\end{matrix}\right.
$$

## 欧拉完全数定理

如果n为偶完全数，则n必定具有 $2^{p-1}*(2^p-1)$ 的形式，且 $2^p-1$ 是素数


## 勾股数组定理

对于每个本原勾股数组 $(a,b,c)$ ，a和b必定一奇一偶，且有以下公式：

$$
\begin{cases}
a = st	\\
b = (s^2-t^2)/2	\\
c = (s^2+t^2)/2	\\
s>t>=1，且s,t为任意互素的奇数
\end{cases}
$$


## 费马大定理

$a^n+b^n=c^n$ ，当n大于等于3时等式不存在自然数a,b,c使等式成立

## 费马小定理

p为素数，对任意正整数a，当有 $gcd(a,b)=1$ ，有 $a^{p-1} \equiv 1 (mod p)$


## 素数定理

x很大时，小于x的素数的个数近似等于 $\frac{x}{ln(x)}$ ，但并不代表其单调递增


## 算术基本定理

任一数均可以唯一方式分解为素因子乘积

## 欧拉定理

$gcd(a,n)=1$ ，则 $a^{\varphi(n)} \equiv 1 (mod n)$



## 欧拉公式

$$
\begin{equation}
\begin{split}
\varphi(x) & = \varphi({p_1}^{k_1}*{p_2}^{k_2}...*{p_n}^{k_n}) \\
& = ({p_1}^{k_1}-{p_1}^{k_1-1})...*({p_n}^{k_n}-{p_n}^{k_n-1}) \\
& = x*(1-\frac{1}{p_1})*(1-\frac{1}{p_2})...*(1-\frac{1}{p_n})
\end{split}
\end{equation}
$$

其中 $p_1...p_n$ 为x的所有质因数，$k_1...k_n$ 分别对应各个质因数的系数


## 欧拉函数运算法则：

* p为素数，$\varphi(p^k) = p^k - p^{k-1}$
* 若 $gcd(m,n)=1，则\varphi(mn) = \varphi(m)\varphi(n)$


## 线性同余定理

* $(p-1)! \equiv h(mod p)$
* 若 $a \equiv h1 (mod p)，b \equiv h2 (mod p)$ ，则 $a \times b \equiv (h1 \times h2) (mod p)$ 且 $a+b \equiv (h1+h2) (mod p)$


## 线性方程最小正整数定理

对于任意正整数x和y，$ax+by$ 的最小正整数等于 $gcd(a,b)$


## 线性方程定理

对于方程 $ax+by=gcd(a,b)$ 总存在解，且均可以表示为 $(x_1+\frac{kb}{gcd(a,b)},y_1-\frac{ka}{gcd(a,b)})$ ，其中k为任意整数，$x_1$和$y_1$为任意正整数解



## 中国剩余定理

$gcd(m,n)=1$ ，则同余式组 $x \equiv b (mod m)$ 与 $x \equiv c (mod n)$ 恰有一解 $0<=x<=mn$


## 原根定理

每个素数都有原根，且恰好有 $\varphi(p-1)$ 个


## 幂和公式

$1^k+2^k+...+n^k=\frac{(n+1+p)^{k+1}-p^{k+1}}{k+1}$



## 佩尔方程定理

方程的每一组解 $x_k,y_k$ 都可表示为 $x_k+y_k \times \sqrt D = (x_1+y_1 \times \sqrt D)^k$



## 素数的两平方数和定理

素数p为两平方数和的充要条件为 $p \equiv 1 (mod 4)$

## 正整数的两平方数和定理

m为正整数，素数分解 $m=p_1 \times p_2... \times p_n$ ，m可以表示成两平方数和的充要条件为 $p_i$ 为2或模4余1

## 欧拉准则

$a^{\frac{p-1}{2}} ≡ \left ( \frac{a}{p} \right ) (mod p)$


## 勒让德符号乘法法则

$\left ( \frac{a}{p} \right )*\left ( \frac{b}{p} \right ) = \left ( \frac{ab}{p} \right )$

## 二次剩余乘法法则

* 若 $a^2 \equiv k_1 (mod p),b^2 \equiv k_2 (mod p)$ ，则 $a^2 \times b^2 \equiv k_1 \times k_2 (mod p)$
* 若 $x^2 \equiv h_1 (mod p)$ 无解， $x^2 \equiv h_2 (mod p)$ 有解，则 $x^2 \equiv h_1*h_2 (mod p)$ 无解
* 若 $x^2 \equiv g_1 (mod p)$ 无解， $x^2 \equiv g_2 (mod p)$ 无解，则 $x^2 \equiv g_1*g_2 (mod p)$ 有解



## 二次互反律（q、p是奇素数）：

* 若 $p \equiv 1 (mod 4)$ ，-1是p的二次剩余；若 $p \equiv 3 (mod 4)$ ，-1是p的非二次剩余
* 若 $p \equiv 1 (mod 8)$ 或 $p \equiv 7 (mod 8)$ ，2是p的二次剩余；若 $p \equiv 3 (mod 8)$ 或 $p \equiv 5 (mod 8)$ ，-1是p的非二次剩余
* 若 $p \equiv 1 (mod 4)$ 或 $q \equiv 1 (mod 4)$ ， $\left ( \frac{q}{p} \right ) = \left ( \frac{p}{q} \right )$ ，若 $p \equiv q \equiv 3 (mod 4)$ ， $\left ( \frac{q}{p} \right ) = -\left ( \frac{p}{q} \right )$



## 算法

* 辗转相除法/欧几里得算法
* 拉托斯特尼筛法/试除法：将小于n的所有数与n进行互质检验
* 费马素数测试【随机算法】：取 $0<=a<m$，且 $gcd(a,m)=1$ ，由逐次平方法求计算 $a^{m-1} (mod m)$ ，若不为1，则根据费马小定理确定不为素数；若为1，则不能确定m为素数还是合数
* 通过欧几里得算法回带可求出一组 $ax+by=gcd(x,y)$ 的整数解
* 求解方程 $x^k \equiv b (mod m)$
* 求解 $\frac{a^k}{m}$ 的值，使用逐次平方法



## 证明

* 证明：存在无穷多个素数
* 证明：存在无穷多个完全数【未解决】
* 证明：存在无穷多个本原勾股数组
* 证明：存在无穷多对孪生素数【未解决】
* 证明：是否存在任意素数N元组
* 证明：是否存在任意长度算数级数的素数列
* 证明：是否存在无穷多个形如 $N^2+1$ 的素数【未解决】
* 证明：是否存在无穷多个梅森素数
* 证明：哥德巴赫猜想【未解决】
* 证明：存在奇完全数吗
* 证明：所有大于2的素数都可以唯一地表示成两个平方数之差


## 一些结论

* $2^n-1$ 与 $2^n+1$ 中若有一个为素数，另一个必为合数
* $gcd(a,b)=1$ ，则 $ax+by=m$ 对 $m+a+b>=a*b$ 一定存在正整数解
* 素数 $P$ 整除 $A^2-1$ ，则 $A \equiv 1(modP)$ 或 $A \equiv -1(modP)$
* 存在任意长度的合数列
* 存在任意长度的素数等差数列



## 哥德巴赫猜想

* 二重（强）哥德巴赫猜想：每个不小于6的偶数都可以表示为两个奇素数之和
* 三重（弱）哥德巴赫猜想：每个不小于9的奇数都可以表示为三个奇素数之和
