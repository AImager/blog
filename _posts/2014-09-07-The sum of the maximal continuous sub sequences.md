---
title: 最大连续子串和
layout: post
tags: [枚举,算法,dp,贪心]
typora-root-url: ../../blog
---

最大连续子串和是一个比较经典的问题，不在于它的难度，而在于它衍生出来的多种解题思路，并且每种思路都极具代表性。

## 问题描述

有一实数序列，定义为 $a_1,a_2,a_3...,a_n$ ，寻找一段连续子序列 $a_i,a_{i+1}...,a_j$ ，其中i<=j，i>=1，j<=n，使得该子序列的和最大。

## DP

在优化算法的过程中，一个常有成效的思路DP，即抽离子问题，然后保存可供复用的子问题解，避免重复计算。在最大连续子串和的问题中， $sum(a_i,...,a_{j+1}) = sum(a_i,...,a_j) + a_{j+1}$ ，因此只要优先算出了 $sum(a_i,...,a_{j-1})$ 并保存下来，那总是可以在O(1)时间复杂度下得到 $sum(a_i,...,a_j)$ 这个子问题的解，从而整体时间复杂度降到了 $O(n^2)$ 。

## 分治

复杂度 $O(nlgn)$

## 贪心

DP可以避免重复计算，但是无法避免不必要的计算，所以考虑有没有办法只循环一次不用回溯就得到结果？嗯，贪心！

假设 $a_i,...,a_j$ 为最大子序列，显然对 $ sum(a_i,...,a_k), i<=k<=j$ ，其值总是大于0，如果小于等于0，则 $sum(a_{k+1},...,a_j)$ 显然就大于等于 $sum(a_i,...,a_j)$ ，因此可以按下面的流程来计算这个结果。

1. 设置 $tempSum=0$ ， $maxSum=a_1$ ， $k=1$ 。
2. 计算 $tempSum = tempSum + a_k$
3. 若 $tempSum >= maxSum$ ，设置 $tempSum = maxSum$ 。
4. 若 $tempSum <= 0$ ，设置tempSum = 0。
5. 设置 $k=k+1$ ，若k大于序列长度n，结束；否则执行1。

以上流程结束后得到的maxSum即最大连续子串和，但是有以下问题需要注意。

* 流程里面没有记录起始位置，如果要记录，需加上一个标志位
* 若存在多个分散的子序列和均为最大值，则上述流程计算的是最后一个，若把第3步的>=改成>，则计算的是第一个
* 若存在两个子序列和均为最大值，且相互为父子关系，则上述流程计算的是较短的一个，若把第4步<=改成<，则计算的是较长的一个

下面给出贪心的代码，DP和枚举的就省了。

```php
$arr = [-1,199,-4,40,-5];
$tempSum = 0;
$maxSum = $arr[0];
$maxStart = 0;
$maxEnd = 0;

$switch = 0;        // 用来表示截断后是否有设置maxStart，1表示没设置

foreach($arr as $index => $val) {
    $tempSum += $val;
    if($tempSum >= $maxSum) {
        if ($switch == 1) {
            $maxStart = $tempMaxStart;
            $switch = 0;
        }
        $maxEnd = $index;
        $maxSum = $tempSum;
    }

    if ($tempSum <= 0) {
        $tempSum = 0;
        $tempMaxStart = $index + 1;
        $switch = 1;
    }
}

echo "\n maxSum : " . $maxSum;
echo "\n maxStart ~ maxEnd : " . $maxStart . " ~ " . $maxEnd;
```



