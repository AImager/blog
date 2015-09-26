---
title: 希尔伯特计划（一）——Fermat's Last Theorem与丢番图方程
layout: post
tag: [希尔伯特计划,数理逻辑]
---


给你下面这个方程，你是否可以很快的给出它的一组解呢？

$$ X^{3}+Y^{3}=Z^{3} (XYZ \neq 0) $$

只要接受了初中以上的数学教育这个问题是很容易解决的，但假如现在仅仅在题目中加上两个字，变为：

$$ 你是否可以很快的给出它的一组整数解呢？$$

这时问题就变得不那么容易了，为了不浪费各位的时间，我们直接给出结论——这个问题是无解的，而且凡是属于以下泛型的式子，都是没有整数解的：

$$ X^{n}+Y^{n}=Z^{n} (n \ge 3, XYZ \neq 0) $$

这就是题目中提到的Fermat's Last Theorem（注：中文大部分翻译都是费马大定理，但这和原意有点违背，所以才用英文来保证严谨性），证明者是个名为怀尔斯的天才数学家，由于怀尔斯的证明过于复杂（本人精力水平有限，如果各位对纯数学十分感兴趣且数学功底足够好，不妨看看论文），所以在此只给出\\( n=4 \\)情况下的证明（同时它也是Fermat's Last Theorem特例下最简单的证明）：

\\( n=4 \\)情况下的证明（无穷递降法，跳过一些数论基本知识）：<br/>
定理一：对勾股方程\\( X^{2}+Y^{2}=Z^{2} \\)，其满足\\( (x,y,z)=1 \\)且\\( 2|x \\)的一般解为\\( x=2ab,y=a^{2}-b^{2},z=a^{2}+b^{2} \\)，其中\\( a,b \\)为奇偶相反的整数

1、如果\\( n=4 \\)时等式有解，则\\( x^{4}+y^{4}=z^{2} \\)也有整数解

2、假设\\( u \\)为\\( x^{4}+y^{4}=u^{2} \\)有解的最小整数，则\\( x,y \\)中至少有个奇数（若\\( x,y \\)同偶，则\\( u \\)也为偶，则左右可约去4，和\\( u \\)最小的假设不符，这方面可参见本原勾股数组）

3、\\( u^{2}=x^{4}+y^{4} \equiv 1 mod 4 \\)，因为
    若\\( u^{2}=4k \\)，则\\( x,y \\)同奇或同偶，同奇是不存在整数解的，同偶则同2证明
    若\\( u^{2}=4k+2=2 \times 奇数 \\)，显然不能为整数平方
    若\\( u^{2}=4k+3 \\)，则\\( u^{2}+1=4 \times (k+1)=4q \\)，\\( u \\)非奇则偶
        若\\( u \\)为奇则令\\( \frac{u^{2}+1}{4}=\frac{(2p+1)^{2}+1}{4}=p^{2}+p+\frac{1}{2} \\)，显然不为整数
        若\\( u \\)为偶则令\\( \frac{u^{2}+1}{4}=\frac{(2p)^{2}+1}{4}=p^{2}+\frac{1}{4} \\)，显然也不是整数，则\\( 3mod4 \\)不可能

4、运用定理一设\\( u=a^{2}+b^{2},x^{2}=2ab,y^{2}=a^{2}-b^{2} \\)

5、不妨设\\( b \\)偶\\( a \\)奇，令\\( b=2c \\)，由于\\( (\frac{x}{2})^{2}=ac \\)且\\( (a,c)=1 \\)，则\\( a,c \\)都为一个整数平方（这个定理在高等代数中有）

6、令\\( a=d^{2},c=f^{2} \\)，则\\( y^{2}=d^{4}-4f^{4} \\)，即\\( (2f^{2})^{2}+y^{2}=(d^{2})^{2} \\)，且\\( 2f^{2},y,d^{2} \\)间均没有公因数

7、再令\\( 2f^{2}=2lm,d^{2}=l^{2}+m^{2},(l,m)=1 \\)，再次应用定理一可设\\( l=r^{2},m=s^{2} \\)，从而\\( r^{4}+s^{4}=d^{2} \\)

8、由于\\( d < u \\)，则前面的假设\\( u \\)为最小解不存在，因此\\( x^{4}+y^{4}=z^{2} \\)无解，从而\\( n=4 \\)时Fermat's Last Theorem成立

其实寻找方程整数解并不是费马创造的先例，公元300多年，当时的数学家丢番图就已经在做这方面的研究，并且还将自己研究的问题集结成册，即现在数学史上的经典著作之一——《算术》。而后来的数学家发现丢番图研究的这类问题价值很高，便单独拉出一条分支，称丢番图方程，其研究的对象换成数学方式表达如下：

$$
\begin{cases}
{a_1} \times {x_1}^{k_1}+{a_2} \times {x_2}^{k_2}+…{a_n} \times {x_n}^{k_n}=c \\\
a_i,x_i,c \in Z
\end{cases}
$$

事实上，Fermat's Last Theorem正是费马在看了《算术》这本书后想到的猜想，所以你会发现，丢番图方程的影响意义不可小觑，而这种影响也直接波及到我们这个系列的主题——希尔伯特计划。