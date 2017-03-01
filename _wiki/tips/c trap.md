---
title: c trap
layout: wiki
category: tips
tags: [c,陷阱]
---


这篇文章会尽量列举C语言的特性和易错点，有些内容可能直接来自于其它书籍（如C陷阱和缺陷、C专家编程等），如果你想快速了解C语言的基础，可以看这篇[C参考手册](/wiki/30%20minutes/c)


## ++

++前缀先算，后缀如果在混合运算中，先忽略掉，即直接算混合运算，混合运算算完后再进行单独的后缀运算，++必须紧跟值而不能跟表达式


## 野指针

野指针：指针指向的动态内存被释放后，没有将指针赋为NULL

## IEEE754

定点数分定点整数和定点小数，原理是均只进行整数运算，定点整数运算就等同于int计算，而定点小数运算一般在单片机（DSP等）才有（因为单片机不需要太大数据计算量，且性能有限，浮点运算就没大必要了）。比如对16位数，1位符号位，3位整数位，12位小数位（定点就没必要记录小数点），2.5的存储位表示为0010 1000 0000 0000
数组与指针的区别


## unsigned

关于signed/unsigned，有无符号是针对编译以上级别而言的，本质（存储）是一样的，而在运算的时候，则是先将补码转换为原码进行计算，然后再转换为补码。这里就有个问题——变量开头为1时，把变量当作负数（signed）和正数（unsigned）计算的结果会不一样，什么情况下需要考虑这种问题呢——强制转换的时候（signed与unsigned混合运算时），例子如下：

unsigned int a=1; int b=-2; 则a+b>0，我们想的是1-2=-1\<0，但实际上a为unsigned，b为signed，为保证不损失信息（强制转换的原则），系统把b当作unsigned计算得到一个unsigned值，虽然得到的结果存储信息始终为0xffffffff(可表示-1也可表示超大正整数)，但这里是当作unsigned处理的，所以就得到了非预想的结果。

## 指针下标

纯指针的下标可以为负数


## 柔性数组

在结构体的最后面（前面必须有变量）可定义一个可变长度的数组，但是这个数组不计入结构体的长度，至于其具体长度在使用的时候用动态内存（malloc等）生成，生成的长度减去结构体前面变量的长度就是数组的长度


## 词法分析的『贪心法』

原则：尽可能多的读取多的字符作为一个组合，如果正在读取的字符可以和当前字符组组成一个组合，那就将这个字符加入当前字符组，然后继续读入，直到不能组成组合，就清空当前字符组，重新开始，看下面的例子：

~~~
a---b    // 等同于(a--)-b，自减最后算

y/*p    // /*作为注释的开始

*p++ = val;  //将val进行压栈

val = *--p;  //将val弹出栈
~~~

## 函数指针

按《C和指针》上的说法，每次函数名用到的地方都是将函数名转换为指针再使用，而&函数名实际上只是对这个操作显示的表达出来——方便阅读，没任何本质区别

## 标识符

标识符的命名原则——字母、数字、下划线，首位不能用数字






## 结合性

C标准中没有给出结合性的标准说明，不过一个比较正确的理解是『在一个表达式中，如果多个符号的优先级相同，那就按结合性选择运算顺序』，如a=b=c，=是从右下向左的结合性，所以先算后面的=再算前面的


## switch

~~~
switch (color){
  case 1: printf("red");
  case 2: printf("black");
  case 3: printf("blue");
}
~~~

如果color值为2，得到的结果为blackblue


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

通过观察反汇编信息，发现为避免麻烦，使用sizeof最好加上括号



根据sizeof我们可以引出指针和数组的不同，当a分别为10字节字符数组和字符串指针时，sizeof(a)分别返回10和4，也就是数组名并不是纯粹意义上的指针，数组是C语言必不可少的内建类型。

对数组只有两种特殊操作——得到数组的大小和确定数组各位置的指针，而其它所有操作都可以转换为对应的指针操作。

sizeof空结构体不为0，结果为多少由编译器决定，但实际在内存中不占位置，只是为了表明这里有变量占用了


## 结构体和函数

结构体名只是标识符，并不代表指针

结构体或联合数据生成时要进行内存对齐（硬件性能与数据存储的原因），至于是否对齐和怎么对齐和硬件有关（x86内存每4个字节对齐），C语言允许通过预处理命令#pragma pack(n)来指定n值（即对齐字节数）



## const与指针传递类型

~~~
指向非常量数据的非常量指针：char \*str
指向非常量数据的常量指针：char \*const str
指向常量数据的非常量指针：const char \*str
指向常量数据的常量指针：const char \*const str
~~~



## 标准中产生的问题

* C99之前的C变量的声明必须在开头
* C99协定int main为最合适的写法
* 关键字const、signed、volatile是ANSI标准中新增加的
* enum和void是ANSI之前新增加的
* entry曾经被保留为关键字


## 边界问题

~~~
while (i<n){
	b[i++] = a[i];
}
~~~

上述代码其实理论上并没错，但容易出现越界问题，且很影响可读性，所以最好不要那么写，实际上，尽量不要用++、\-\-




## 求值顺序

和求值顺序有关的只有四个运算符

~~~
&&  先算左边，左边为True时算右边
||  先算左边，左边为False时算右边
,   先算左边，算完后扔掉再算右边
?:  先算最前面，True就算中间，False就算后面
~~~







## 参数传递

无论是实参还是形参传递其值都是采用中间变量存储，实参没什么好证明的，直接证明形参（还是通过objdump反编译查看）

~~~C
;代码
#include <stdio.h>

void test(int a){}

int main(){
  int a = 2;
  test(a);
  return 0;
}


;反编译代码
080483b4 <test>:
 80483b4:	55                   	push   %ebp
 80483b5:	89 e5                	mov    %esp,%ebp
 80483b7:	5d                   	pop    %ebp
 80483b8:	c3                   	ret

080483b9 <main>:
 80483b9:	55                   	push   %ebp
 80483ba:	89 e5                	mov    %esp,%ebp
 80483bc:	83 ec 14             	sub    $0x14,%esp
 80483bf:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
 80483c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80483c9:	89 04 24             	mov    %eax,(%esp)
 80483cc:	e8 e3 ff ff ff       	call   80483b4 <test>
 80483d1:	b8 00 00 00 00       	mov    $0x0,%eax
 80483d6:	c9                   	leave
 80483d7:	c3                   	ret
~~~

查看反编译代码，80483bf用于赋值a（在C语言程序中a是放在栈中的，关于C内存详情，后面有讲），80483c6用于把a的值传到eax寄存器，80483c9用于将eax中的值传到esp的内存区域（这就是在生成变量副本，为调用函数做准备），80483cc则显然是在调用函数



## int argc, char \*argv[]

用于程序开始执行时的参数传入，argc表示参数个数，argv表示字符串数组，每个字符串算一个参数，调用程序时的程序名始终作为第一个参数






## 内存分配

* 局部变量存储在栈中
* 动态申请的存储在堆中
* 字符串常量存储在静态存储区
* 初始化的全局变量、静态变量存储在静态存储区
* 未初始化的全局变量、静态变量存储在BSS区



C语言中文件系统分缓冲文件系统和非缓冲文件系统（和使用的类库有关），缓冲文件系统会在进行文件读写操作时，自动为每一个正在使用的文件分配一个缓冲区（内存的一部分），当读写文件时，先经过缓冲区，等缓冲区被数据装满，在过到磁盘文件或者内存数据中去，缓冲区大小有C语言系统决定（一般512字节），如结构体类型FILE（已经定义好了的），里面包含与文件有关信息——缓冲区大小、缓冲区位置、文件的读写指针等，缓冲区的意义在于加大读写速度，而且可以通过操作缓冲区（C语言中的库函数）来实现一些特殊的功能


## 词法规则

所有元素被划分为6类：标识符、关键字、常量、字符串字面值、运算符、其它分隔符

空格、横向/纵向制表符、换行符、换页符、注解（合称为空白符）被略过



## /\*/\*/0\*/\*\*/1

ANSI标准C是不支持注释嵌套的，但有的编译器在实现的时候还是支持的

支持嵌套的时候：贪心法[1~2]作为单运算符，[3~4]继续作单运算符——匹配[7~8]，则/0作为注释内容，[10~11]匹配[1~2]，则*作为注释内容，结果为1

不支持嵌套的时候：贪心法[1~2]作为单运算符，此时后面出现的/\*均不算数（直到第一个\*/结束），则[3]作为单运算符，[4~5]由贪心法作为单运算符匹配[1~2]，此时/作为注释内容，而后0*是未注释部分，[8~9]作为新注释匹配[10~11]，1未注释，则去掉注释内容后结果为0\*1=0


## 括号

圆括号：圆括号代表最高优先级的运算符，一个圆括号内的表达式无论多么复杂，其最终只返回一个数据

花括号：花括号代表一个代码区块，是一个作用域


## side effect

## Undefined behavior

## Implementation-defined behavior

## Unspecified behavior


## 简单的代码测试

~~~C
// Environment: X86 Ubuntu GCC

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void){
    // test1---about point's length
    printf("--------------------1:------------------\n");
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
	printf("--------------------1:------------------\n\n");



    // test2---about struct's name
    printf("--------------------2:------------------\n");
	struct test2_1{
	char test2_2;
	double test2_3;
	int test2_4[3];
    }test2_5={'c',8.0,2,3,4};
    printf("%p %p %p\n ",&test2_5.test2_2,&test2_5.test2_3,test2_5.test2_4);
    int test2_6[3]={1,2,3};
    printf("%p %p\n",&test2_6,&test2_6[0]);
	printf("--------------------2:------------------\n\n");




    // test6---about double's storage,read IEEE 754
 	printf("--------------------6:------------------\n");
	double test6_1=0.1;
    printf("%20.19lf\n",test6_1);
	printf("--------------------6:------------------\n\n");



    // test7---about array's initialize
	printf("--------------------7:------------------\n");
    int test7_1[][1]={1,2,3,4,5};
    int test7_i;
    for (test7_i=0;test7_i<=4;test7_i++){
	printf("%d\n",test7_1[test7_i][0]);
    }
    //int test7_2[5][]={1,2,3,4,5};	//can't work
    //int test7_j;
    //for(test7_j=0;test7_j<=4;test7_j++){
    //	printf("%d",test7_2[test7_j][1]);
    //}
	printf("--------------------7:------------------\n\n");



    // test8---about point and const
	printf("--------------------8:------------------\n");
    int test8_1=3;
    int test8_2=4;
    const int *test8_3=&test8_1;
    int *const test8_4=&test8_1;
    const int *const test8_5=&test8_1;
    //test8_4=&test8_2;	//can't work
    //test8_3[0]=3;	//can't work
	printf("--------------------8:------------------\n\n");



    // test9---about memory's use
	printf("--------------------9:------------------\n");
    char test9_1;
    int test9_2;
    double test9_3;
    char test9_4;
    printf("%p %p %p %p\n",&test9_1,&test9_2,&test9_3,&test9_4);
 	printf("--------------------9:------------------\n\n");



	// test10---test trend is a order or not
	printf("--------------------10:-----------------\n");
	int* test10_1=(int*)malloc(sizeof(int)*5);
	printf("%p,%p,%p\n",test10_1,test10_1+1,test10_1+2);
	test10_1=(int*)realloc(test10_1,sizeof(int)*10);
	printf("%p,%p,%p\n",test10_1,test10_1+1,test10_1+9);
	free(test10_1);
	printf("--------------------10:-----------------\n\n");



	// test11---test free can work in int* or not
	printf("--------------------11:-----------------\n");
	//int* test11_1;		// all can't work
	//free(test11_1);
	//int test11_2[3]={1,2,3};
	//int* test11_3=test11_2;
	//free(test11_3);
	printf("--------------------11:-----------------\n\n");



	// test12---test sizeof and strlen
	printf("--------------------12:-----------------\n");
	char test12_1[6]="12345";
	printf("%d %d\n",sizeof(test12_1),strlen(test12_1));
	printf("--------------------12:-----------------\n\n");



	// test13---test ++i i++ in left or right
	printf("--------------------13:-----------------\n");
	int *test13_1=(int*)malloc(6*sizeof(int));
	int test13_2;
	printf("%p\n",test13_1);
	for(test13_2=1;test13_2<=6;test13_2++){
		test13_1[test13_2-1]=test13_2;
		printf("%d ",test13_1[test13_2-1]);
	}
	printf("\n");
	*test13_1++ =10;
	printf("%p\n",test13_1);
	for(test13_2=1;test13_2<=6;test13_2++)
		printf("%d ",test13_1[test13_2-1]);
	printf("\n");
	printf("--------------------13:-----------------\n\n");


	return 0;
}

~~~
