---
title: function
layout: wiki
category: c
tags: [函数]
---

## 函数

### `int argc, char *argv[]`

用于程序开始执行时的参数传入，argc表示参数个数，argv表示字符串数组，每个字符串算一个参数，调用程序时的程序名始终作为第一个参数。


### 参数传递

无论是实参还是形参传递其值都是采用中间变量存储，实参没什么好证明的，直接证明形参（还是通过objdump反编译查看）。

```c
// 代码
#include <stdio.h>

void test(int a){}

int main(){
  int a = 2;
  test(a);
  return 0;
}
```

```nasm
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
```

查看反编译代码，80483bf用于赋值a（在C语言程序中a是放在栈中的，关于C内存详情，后面有讲），80483c6用于把a的值传到eax寄存器，80483c9用于将eax中的值传到esp的内存区域（这就是在生成变量副本，为调用函数做准备），80483cc则显然是在调用函数。