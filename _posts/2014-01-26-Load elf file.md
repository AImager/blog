---
title: ELF文件加载
layout: post
tags: [页映射,虚拟内存]
typora-root-url: ../../blog
---

之前谈了ELF文件的结构，现在就聊聊ELF文件的载入。本文的ELF文件限定的更小些，特指可执行文件。对于可执行文件的载入，历史最早的做法是静态载入，即将所有程序文件全载入内存，但这显然没法充分利用内存，而且对于大程序文件无能为力，所以出现了动态载入的方式，覆盖载入和页映射是两种典型的动态装载方式，覆盖载入主要是通过程序员自己编写程序进行模块划分并决定何时载入某个模块，但这个事情交给应用程序来做，显然是对程序员效率的摧残，而且基本保证不了软件和系统的可用性，所以慢慢的也退出历史舞台了，既然前面的缺点这么明显，那剩下的就是本文着重介绍的页映射动态装载方式了。在介绍装载前，有必要说一说装载机制完成的基础——虚拟内存。

## 虚拟内存

写两个不同的程序，编译成可执行文件后，查看elf头，我们会发现程序的起始地址都是0x8048080（这里限定在32位某个特定发行版本下编译），那么一个直观的想法是，两个程序同时运行，会不会出现内存地址冲突？如果是最初的内存设计，自然会，但也是为了避免这样的问题，所以引入了虚拟内存。

虚拟内存即每个进程都有独立的内存空间，这个空间的大小固定，且和操作系统的位数有关，32位系统的大小即2^32=4G，但为了保证空间隔离，有部分虚拟空间只对内核开放，Linux下内核空间大小默认为1G，Windows下默认为2G。有了虚拟内存，后面的核心工作就是如何将虚拟空间和实际的物理空间对应起来了。

### 分页

在虚拟内存的基础上，计算机引入了『分页』功能，即将内存划分为大小相同的『页』，其中『页』表示内存动态载入的最小单位，而合理的『页』大小可以保证内存利用率，同时避免频繁的物理页和虚拟页转换造成的性能损耗。一般在32位系统上这个『页』大小为4KB。

既然『页』是动态载入的最小单位，那么建立虚拟空间和物理空间之间的映射实际上就是建立虚拟内存页和物理内存页的一一对应关系。这个页对应关系采用『页表』来存储，最初只有一级页表，这就导致每个进程光页表最多就要占用`4G/4K*4B=4M`空间，这显然是不太能接受的，所以后来引入了多级页表的机制，且一般称一级列表为页目录。引入以上机制后，下面为一个虚拟地址到物理地址的完整转换流程图

![](/media/.img/page.jpg)

上图表示的转换过程非常清晰，所以不再赘述，但有以下几点需要注意

* cr3是CPU的一个控制寄存器，它总是记录着当前运行进程的页目录的物理基地址。
* 页目录的每一项均有4字节，但其中只有20位用于存储指向页表的地址，因为每个页表大小为2^12=4K，4G虚拟空间对应2^20个页，所以20位恰好可以指向任意页，而剩下的12位则存储权限等相关控制信息。同理，中间页表也只有20位存储指向下一级页表的地址。
* 整个转换过程由MMU（CPU的内存管理单元）完成。

## 进程的创建与运行

对操作系统而言，可执行文件载入的最终结果就是进程的创建和运行，这个过程我们主要关注以下几点

* PCB和虚拟内存的创建
* 建立虚拟内存和可执行文件间的映射关系
* 进程运行，动态载入物理页

任何进程在创建时，操作系统都会为其分配一个进程控制块，即PCB，它记录着进程所有重要的元信息，是进程最重要的数据结构。在Linux下，PCB由task_struct这个结构体表示。除了PCB，进程在启动的时候还会建立虚拟内存，在32位系统下这个过程实际上就是建立页目录，而下级页表则在缺页的时候动态添加，这样最初的虚拟内存建立就只需要4KB的物理空间。

此时，PCB和虚拟内存已创建完成，但页目录内还没有物理地址相关信息，那么进程运行的时候肯定会出现无法转换成物理地址的情况，我们称这样的情况叫缺页。一旦出现缺页的情况，就需要做几件事情，一是将缺少的物理页从磁盘载入到物理内存页，然后将对应物理页和虚拟页地址的对应关系写到页表中去（如果缺页表就动态新建）。但是操作系统是如何知道该导入可执行文件的哪个部分呢？答案就是建立虚拟内存和可执行文件间的映射关系。这个映射关系在Linux下使用名为vm_area_struct的结构体表示，简称VMA，其简要结构如下

```c
struct vm_area_struct {
    /* The first cache line has the info for VMA tree walking. */

    unsigned long vm_start;        /* Our start address within vm_mm. */
    unsigned long vm_end;        /* The first byte after our end address within vm_mm. */

    /* linked list of VM areas per task, sorted by address */
    struct vm_area_struct *vm_next, *vm_prev;

    struct rb_node vm_rb;

    ...

    /* Second cache line starts here. */

    struct mm_struct *vm_mm;    /* The address space we belong to. */
    pgprot_t vm_page_prot;        /* Access permissions of this VMA. */
    unsigned long vm_flags;        /* Flags, see mm.h. */

    ...

    /* Information about our backing store: */
    unsigned long vm_pgoff;        /* Offset (within vm_file) in PAGE_SIZE units */
    struct file * vm_file;        /* File we map to (can be NULL). */

    ...
};
```

其中vm_start表示虚拟地址的起始地址，vm_end表示虚拟地址的结束地址，vm_pgoff表示映射起始位置在文件里的偏移页数，vm_file则指向描述文件信息的结构体（包括inode信息等）。举例来说，对于program_table如下的可执行文件而言，操作系统会建立两个VMA，即每个program都会对应一个VMA。第一个VMA的vm_start=0x8048000，vm_end=0x8049000，vm_pgoff=0（相对偏移为0，所偏移的页数为0）；第二个VMA的vm_start=0x8049000，vm_end=0x804a000，vm_pgoff=0（相对偏移为89，所偏移的页数为0）。

```
Elf 文件类型为 EXEC (可执行文件)
入口点 0x8048080
共有 2 个程序头，开始于偏移量 52

程序头：
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
  LOAD           0x000000 0x08048000 0x08048000 0x00089 0x00089 R E 0x1000
  LOAD           0x00008c 0x0804908c 0x0804908c 0x00001 0x00001 RW  0x1000

 Section to Segment mapping:
  段节...
   00     .text
   01     .data
```

建立了VMA，接下来将指令寄存器设置成入口地址0x8048080后运行。但是0x8048080所在的页是空的，所以产生页错误，然后根据VMA载入可执行文件的program里Offset为0x000000~0x00008d的数据至一个物理内存页里，同时建立物理内存页和0x8048号虚拟页的映射关系（即修改页表），然后回到主程序流程。

至此，载入流程完成，但在接下来的进程运行过程中，页错误会不断发生以保证需要的页被不断载入直到进程结束。最后，补充下VMA和PCB的关系图（其中mm_struct记录所有内存相关信息，而mmap则指向VMA链表）。

![](/media/.img/mmap.png)


## 彩蛋：多级页表不能节省内存

不知道是谁开始传出来的多级页表可以节省内存。实际上，几乎所有操作系统的书籍上都未表明这一点，以汤子瀛的考研操作系统书为参考，里面对多级页表的描述为『对于要求连续的内存空间来存放页表的问题，可利用将页表进行分页』，而对于占用内存太大的问题，操作系统是通过『只将当前需要的部分页表项调入内存，其余的页表项仍驻留在磁盘上，需要时再调入』来解决的，所以多级页表实际上是为了解决『不容易找到连续的大存储空间』这个问题的。而在《Linux内核2.4版源代码分析大全》这本书中则明确表示以32位Linux为例，二级页表所需空间为4KB+4MB，但为了节省空间，开始只分配4KB的页目录和部分页表，其它页表会进行动态载入。当然，前面说了『几乎所有的操作系统书籍』，所以也有那么些书表明了这个错误观点，比如在豆瓣上评分颇高的《深入Linux内核架构》。

## 附录：分段机制

除了分页机制，虚拟内存还含有分段机制，它也是通过硬件和软件协调完成的，而且地址转换的时候，分段是在分页前。linux下分段机制只是做了简单的兼容处理，所以本文叙述中并未引入其介绍。相关细节，可以查阅任意一本讲解操作系统的书。

## 参考链接

* [程序员的自我修养](https://book.douban.com/subject/3652388/)
* [理解inode](http://www.ruanyifeng.com/blog/2011/12/inode.html)
* [内存管理单元](https://zh.wikipedia.org/wiki/%E5%86%85%E5%AD%98%E7%AE%A1%E7%90%86%E5%8D%95%E5%85%83)
* [分段机制](http://blog.csdn.net/liutianshx2012/article/details/52369163)