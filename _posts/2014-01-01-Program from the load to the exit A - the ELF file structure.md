---
title: 程序从加载到退出的过程（一）——ELF文件结构
layout: post
tag: [计算机原理,进程管理,nasm,编译,链接]
---

文章题目很大，但想了下还是找不出更好的题目来替换（文字功底有限），所以只能想办法慢慢的填这个大坑。在开始之前，先介绍下环境和工具，系统是基于Parallels（主系统为OS X10.10）的Ubuntu32位虚拟机，版本号12.04，但我也实验过centos，基本没有区别，而用于分析的程序由nasm汇编语言编写，nasm的版本号为2.09.10，之所以采用nasm编写程序，是为了简化编译链接过程，避免最后的目标文件中太多无关段影响分析，主要的分析工具为readelf（用来查看可执行文件的段信息）和objdump（主要用来查看反汇编信息）。

## 什么是ELF文件

ELF文件指一般在\*nix下的可执行文件格式文件，也即通俗意义上的Linux程序，它主要可以归纳为以下四种文件

* 可重定位文件，如Linux的.o文件
* 可执行文件，如/bin下的执行文件
* 共享目标文件，如/lib中的.so库
* 核心转储文件，如Linux下的core dump

因为本篇的研究只涉及到前两种，所以后面提到的ELF文件一律指代前两种文件

## ELF文件中有什么（实验）

ELF文件主要是由文件头（ELF Header）、段表（Section Header Table）以及一个个段（Section）组成的，至于各部分的具体内容以及这些部分是如何组织的，我们通过实验来观察。首先，用nasm编写用于分析的程序（如果还没有安装nasm，请通过命令apt-get或yum安装），代码如下，命名为test.asm，其实现的功能仅仅是做一个加法

~~~nasm
; ~/test/test.asm

[section .data]  ;数据段
	dataAdd db 1
[section .text]  ;代码段
	global _start
	_start:
		mov al,2
		mov [dataAdd],al
		jmp _start   ;循环
~~~

接着分别编译和链接产生test.o重定位文件和test可执行文件

~~~code_text
> nasm -f elf test.asm -o test.o

> ld -s test.o -o test

~~~

至此，供本文分析的两种ELF文件已经生成。

## ELF文件头

虽然test.o和test都被称为ELF文件，但因为分属重定位文件和可执行文件，所以内部结构也会存在细微的差异，因此现在开始分别对两种ELF文件进行分析，首先执行`readelf -h test.o`来查看test.o最重要的部分——ELF文件头，实际上，所有ELF文件最重要的部分均为ELF文件头

执行查看test.o的文件头信息

~~~code_text
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
~~~

Entry point address：程序文件加载近的起始地址
Start of program headers：程序运行时相对于文件的起始位置
Start of section headers：段表相对于文件的起始位置
Size of this header：文件头的大小
Size of section headers：每个段表的大小
Number of section headers：段表的个数

如果你的系统是64位的，请使用命令`ld -m elf_i386 -s -o hello hello.o`进行链接

执行readelf命令查看ELF文件test.o具有哪些段

~~~code_text
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
~~~



组织以上的信息就可以得到ELF文件（这里特殊的指重定向文件）的组织方式，





~~~code_text
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
~~~


~~~code_text
There are 4 section headers, starting at offset 0xa4:

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        08048080 000080 000009 00  AX  0   0 16
  [ 2] .data             PROGBITS        0804908c 00008c 000001 00  WA  0   0  4
  [ 3] .shstrtab         STRTAB          00000000 00008d 000017 00      0   0  1

~~~


hexdump -C test

~~~code_text
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

~~~







