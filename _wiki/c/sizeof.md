---
title: sizeof
layout: wiki
category: c
tags: [sizeof,strlen]
---

## sizeof

sizeof不是一个函数，字节数的计算在程序编译时进行，通过下面这个例子可以证明这一点

~~~
// test.c

#include <stdio.h>

int main(){
  int a = sizeof 1;
  return 0;
}
~~~

~~~
;编译但不链接test.c文件
> gcc -c test.c -o test.o

;反汇编查看test.o
> objdump -d test.o

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	c7 45 fc 04 00 00 00 	movl   $0x4,-0x4(%ebp)
   d:	b8 00 00 00 00       	mov    $0x0,%eax
  12:	c9                   	leave
  13:	c3                   	ret
~~~

* 为避免麻烦，使用sizeof最好加上括号。
* 根据sizeof我们可以引出指针和数组的不同，当a分别为10字节字符数组和字符串指针时，sizeof(a)分别返回10和4，也就是数组名并不是纯粹意义上的指针，数组是C语言必不可少的内建类型。
* 对数组只有两种特殊操作——得到数组的大小和确定数组各位置的指针，而其它所有操作都可以转换为对应的指针操作。
* sizeof空结构体不为0，结果为多少由编译器决定，但实际在内存中不占位置，只是为了表明这里有变量占用。

~~~C
struct test1_1{
	double test1_2;
	char test1_3;
	struct test1_1 *test1_4;
}*test1_5;

printf("%d\n",sizeof(test1_5));
double test1_6=3.0,*test1_7;
test1_7=&test1_6;
double test1_8[3]={1,2,3};
printf("%d\n",sizeof(test1_7));
printf("%d\n",sizeof(test1_8));

/**
 * output
 * 8
 * 8
 * 24
 */
~~~


## sizeof与strlen

~~~C
char str[6]="12";
printf("%d %d\n",sizeof(str),strlen(str));

/**
 * output
 * 6 2
 */
~~~