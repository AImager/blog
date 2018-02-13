---
title: array
layout: wiki
category: c
tags: [数组]
---

在结构体的最后面（前面必须有变量）可定义一个可变长度的数组，这个数组被称为柔性数组，但是这个数组不计入结构体的长度，至于其具体长度在使用的时候用动态内存（malloc等）生成，生成的长度减去结构体前面变量的长度就是数组的长度。