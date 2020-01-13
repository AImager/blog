---
title: ELF文件结构
layout: post
tags: [计算机原理,nasm,编译,链接]
---

在开始之前，先介绍下环境和工具，系统是基于Parallels（主系统为OS X10.10）的Ubuntu32位虚拟机，版本号12.04，但我也实验过centos，基本没有区别，而用于分析的程序由nasm汇编语言编写，之所以采用nasm编写程序，是为了简化编译链接过程，避免最后的目标文件中太多无关段影响分析，主要的分析工具为readelf（用来查看可执行文件的段信息）和objdump（主要用来查看反汇编信息）。

## 什么是ELF文件

ELF文件指一般在Unix-like下的可执行格式文件，也即通俗意义上的Linux程序，它主要可以归纳为以下四种文件

* 可重定位文件，如Linux的.o文件
* 可执行文件，如/bin下的执行文件
* 共享目标文件，如/lib中的.so库
* 核心转储文件，如Linux下的core dump

因为本篇的研究只涉及到前两种，所以后面提到的ELF文件一律指代前两种文件

## ELF文件中有什么（实验）

ELF文件主要是由文件头（ELF Header）、段表（Section Header Table）以及一个个段（Section）组成的，至于各部分的具体内容以及这些部分是如何组织的，我们通过实验来观察。首先，用nasm编写用于分析的程序（如果还没有安装nasm，请通过命令apt-get或yum安装），代码如下，命名为test.asm，其实现的功能仅仅是做一个加法

```x86asm
[section .data]  ;数据段
    dataAdd db 1
[section .text]  ;代码段
    global _start
    _start:
        mov al,2
        mov [dataAdd],al
        jmp _start   ;循环
```

接着分别编译和链接产生test.o重定位文件和test可执行文件

```shell
# 编译
nasm -f elf test.asm -o test.o

# 链接
ld -s test.o -o test

# 64位链接
ld -m elf_i386 -s -o test test.o
```

至此，供本文分析的两种ELF文件已经生成。

### ELF文件头

ELF文件头是ELF文件最核心的部分，它记录一个ELF文件的类型、版本、段位置、加载位置等关键信息。我们可以通过执行`readelf -h test.o`来查看test.o的ELF文件头

```
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          64 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         7
  Section header string table index: 3
```

取其中几个关键的指标进行说明：

* Entry point address：程序文件加载进内存的起始地址
* Start of program headers：程序运行时相对于文件的起始位置
* Start of section headers：段表相对于文件的起始位置
* Size of this header：文件头的大小
* Size of section headers：每个段表的大小
* Number of section headers：段表的个数

### ELF文件段

除了ELF文件头，ELF文件还有一个重要的组成部分就是文件段，包括段表和段，其中段表用于记录段的关键信息，比如名字、类型、地址、长度等，执行readelf命令查看ELF文件test.o的段表

```
> readelf -S test.o
There are 7 section headers, starting at offset 0x40:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .data             PROGBITS        00000000 000160 000001 00  WA  0   0  4
  [ 2] .text             PROGBITS        00000000 000170 000009 00  AX  0   0 16
  [ 3] .shstrtab         STRTAB          00000000 000180 000031 00      0   0  1
  [ 4] .symtab           SYMTAB          00000000 0001c0 000060 10      5   5  4
  [ 5] .strtab           STRTAB          00000000 000220 000019 00      0   0  1
  [ 6] .rel.text         REL             00000000 000240 000008 08      4   2  4
```

从输出结果中可以看出test.o包含7个段，下面对常见段做简短说明

* .data: 存储初始化变量
* .rodata: 存储常量、const变量
* .text: 存储程序代码
* .shstrtab: 存储段名字符串
* .strtab: 存储除段名的各种字符串
* .bss: 存储未初始化变量，开始为空不占空间
* .rel.text: 存储重定位的相关信息

根据上面的信息，我们可以画出test.o的ELF文件图，如下

![](/media/img/2014/Relocatable_file.png)

## 可执行文件

可执行文件是在重定向文件的基础上链接后得到的，ELF Header的结构没有差异，但是相应的Type会变化，而Entry point address也因为重定向设置成了虚拟地址。

```
ELF Header:
  Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF32
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Intel 80386
  Version:                           0x1
  Entry point address:               0x8048080
  Start of program headers:          52 (bytes into file)
  Start of section headers:          164 (bytes into file)
  Flags:                             0x0
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         2
  Size of section headers:           40 (bytes)
  Number of section headers:         4
  Section header string table index: 3
```

虽然我们的测试程序只有4个section，但实际上一个可执行文件通常会有非常多section，如果每个section分开载入，页空隙造成的内存浪费就很严重，所以可执行文件里会将多个访问权限相同的section再次合并成program单位（对应program header table里的描述），同一个program里的section可以载入到相同页中（为了能载入成功，链接的时候相同program的section会连续存放）。

但即使将section合并成program还是会存在内存空隙，所以最后还是会将虚拟内存地址连续的program合并到同一页，并采用多次映射的方式解决访问的问题。

![](/media/img/2014/Executable_file.png)

## 附录：test文件二进制结构

通过`hexdump -C test`把test文件以二进制和ASCII的形式显示

```
00000000  7f 45 4c 46 01 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 03 00 01 00 00 00  80 80 04 08 34 00 00 00  |............4...|
00000020  a4 00 00 00 00 00 00 00  34 00 20 00 02 00 28 00  |........4. ...(.|
00000030  04 00 03 00 01 00 00 00  00 00 00 00 00 80 04 08  |................|
00000040  00 80 04 08 89 00 00 00  89 00 00 00 05 00 00 00  |................|
00000050  00 10 00 00 01 00 00 00  8c 00 00 00 8c 90 04 08  |................|
00000060  8c 90 04 08 01 00 00 00  01 00 00 00 06 00 00 00  |................|
00000070  00 10 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000080  b0 02 a2 8c 90 04 08 eb  f7 00 00 00 01 00 2e 73  |...............s|
00000090  68 73 74 72 74 61 62 00  2e 74 65 78 74 00 2e 64  |hstrtab..text..d|
000000a0  61 74 61 00 00 00 00 00  00 00 00 00 00 00 00 00  |ata.............|
000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000000c0  00 00 00 00 00 00 00 00  00 00 00 00 0b 00 00 00  |................|
000000d0  01 00 00 00 06 00 00 00  80 80 04 08 80 00 00 00  |................|
000000e0  09 00 00 00 00 00 00 00  00 00 00 00 10 00 00 00  |................|
000000f0  00 00 00 00 11 00 00 00  01 00 00 00 03 00 00 00  |................|
00000100  8c 90 04 08 8c 00 00 00  01 00 00 00 00 00 00 00  |................|
00000110  00 00 00 00 04 00 00 00  00 00 00 00 01 00 00 00  |................|
00000120  03 00 00 00 00 00 00 00  00 00 00 00 8d 00 00 00  |................|
00000130  17 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
00000140  00 00 00 00                                       |....|
00000144
```


