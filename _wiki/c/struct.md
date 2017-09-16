---
title: struct
layout: wiki
category: c
tags: [结构体]
---

结构体名只是标识符，并不代表指针。

结构体或联合数据生成时要进行内存对齐（硬件性能与数据存储的原因），至于是否对齐和怎么对齐与硬件有关（x86内存每4个字节对齐），C语言允许通过预处理命令#pragma pack(n)来指定n值（即对齐字节数）。

~~~c
struct test2_1{
	char test2_2;
	double test2_3;
	int test2_4[3];
}test2_5={'c',8.0,2,3,4};

printf("%p %p %p\n ",&test2_5.test2_2,&test2_5.test2_3,test2_5.test2_4);
int test2_6[3]={1,2,3};
printf("%p %p\n",&test2_6,&test2_6[0]);
~~~
