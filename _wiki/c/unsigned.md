---
title: unsigned
layout: wiki
category: c
tags: [无符号]
---

关于signed/unsigned，有无符号是针对编译以上级别而言的，本质（存储）是一样的，而在运算的时候，则是先将补码转换为原码进行计算，然后再转换为补码，这里就有个问题，变量开头为1时，把变量当作负数（signed）和正数（unsigned）计算的结果会不一样，什么情况下需要考虑这种问题呢？嗯，强制转换的时候（signed与unsigned混合运算时）。

`unsigned int a=1; int b=-2;`，逻辑上a+b>0，但实际上a为unsigned，b为signed，为保证不损失信息（强制转换的原则），系统把b当作unsigned计算得到一个unsigned值，虽然得到的结果存储信息始终为0xffffffff(可表示-1也可表示超大正整数)，但这里是当作unsigned处理的，所以就得到了非预想的结果。