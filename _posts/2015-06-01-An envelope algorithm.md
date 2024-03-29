---
title: 求一类数据的包络算法
layout: post
tags: [包络,算法]
typora-root-url: ../../blog
---

【注：本文筛选自本人的本科毕业论文】

在实际的数据处理过程中，有时候需要进行一些定性分析（比如分析数据的大致走向），以便于在进行后期的定量分析的时候能够对全局状态有个大致的把握。由于包络线简单直观可视的特性，使得它在定性分析上拥有无可比拟的优势。本文将介绍一个求包络的算法，同时给出一个评判包络好坏的标准。

在给定数据集的情况下，求包络一般包括分为筛选点集、插值两个过程，因为插值已经有比较成熟的算法体系（本文所有的插值均采用三次样条插值的方法），所以我们给的包络算法核心主要咋筛选点集上。因为包络一般需要保证数据点在其之下，所以在筛选点集的时候我们一般在极值点上进行筛选，那是否只要筛选出极值点就可以了呢？显然是不行的，因为这样可能会得到下图的包络——并没有什么卵用

![](/media/.img/Envelope_algorithm_01.jpg)

那么如何筛选出我们需要的极值点呢？第一个蹦出来的想法应该是分段处理（实际上细分的思想在很多学科中都有应用，比如数学的极限、电气的小波分析等），对应的也就产生了定义域分段和值域分段两种处理方式，编码很容易，所以结果很容易就得到了，如下图为定义域分段得到的包络，值域分段得到的结果类似，就不直接上图了。

![](/media/.img/Envelope_algorithm_02.png)

从上图可以清晰的分辨出包络的轨迹，相比于第一幅图的结果已经是天壤之别了，但是我把这样的图拿给导师看，他却并不觉得有任何改进，回复是依旧没有显示出包络的核心意义——数据的大致走向。细想下来，确实如此，因为定义域分段和值域分段目前都采用的均匀分段的方法，但实际数据特性一致的分段区间间隔并不一样，而且均衡分段的间隔大小在一个连续环境下并不好确定，这就导致在丢失了很多相关信息的前提下也不能找到当前最优解，所以提出了一种迭代筛选极值的方法，保证筛选的粒度由系统本身决定，筛选的具体流程如下：

* 初始一个空序列 $A$
* 从极大值序列 $JX$ 中取出最前面的三个极大值点 $JX_1, JX_2, JX_3$
* 以 $JX_1$ 和 $JX_3$ 作为控制点进行插值，得到插值函数 $f(x)$
* 若 $f(jx_2)>=jy_2$ ，即表明 $JX_2$ 点在 $JX_1, JX_3$ 组成的包络下， $JX_2$ 对最终的包络并不会产生影响，则可将极值点 $JX_2$ 筛去，得到一个新的极大值序列 $JX$ ，同时跳转到步骤2进行循环筛选；若 $f(jx_2)<jy_2$ ，即表明 $JX_2$ 点在 $JX_1, JX_3$ 组成的包络上， $JX_2$ 将对最终的包络产生影响，则此时将 $JX_1$ 加入序列 $A$ ，同时得到新的序列 $JX$ 并跳转到步骤2进行循环筛选
* 当 $JX$ 序列只剩下两个点的时候,将两个点均加入序列 $A$

使用通过迭代筛选极值得到的点集绘制包络，得到的效果图如下

![](/media/.img/Envelope_algorithm_03.png)

仔细观察，结果确实相比上面好太多了，而这恰好也是我导师想要的效果，所以默认状态下筛选点集的问题算是告一段落了。但实际情况是，当我把这几幅图给其他人看时，有的人却认为第二幅图的效果要更好一些，理由是反应的细节更清晰，那么问题来了，如何评价一个相同原始集下包络的好坏呢？答案是并不会有真正意义上的好坏，因为包络本身是作为观察分析数据的工具而存在的，那么这个工具的好坏就全由所希望显现的数据特征来决定，所以最好的好坏标准来自于使用者与使用环境，不过我们可以从定义入手给一个相对客观的评价标准，公式如下（其中 $HH(X)$ 为上包络函数， $HE(X)$ 为下包络函数， $f(x)$ 为原始集的一次线性拟合函数， $[a,b]$ 为原始集定义域区间， $n$ 为从原始集筛选出的极值点个数）

$$ W = \frac{ \int_{a}^{b} \left | \frac{HH(x)+HE(x)}{2} - f(x) \right |}{b-a} * n $$

当然，这个标准仅作为参考，最终还是需要结合具体的需求去灵活选择包络的粒度、平滑度等参数。

最后，附上迭代筛选极值画包络的Matlab程序地址：[matlab-code](https://github.com/AImager/blog/blob/master/media/share/2015/envelope/)
