---
title: Linux网络I/O模型
layout: post
tag: [阻塞,轮询,同步,异步,epoll]
---

网络I/O模型应该是后端开发里最经典的话题之一了，相关内容在《UNIX网络编程卷一》中都有，所以这里以read来概括下五种I/O模型的主要思路『注：I/O模型的描述均分为监听和操作两个步骤』。

## 阻塞式I/O

![](/media/img/2016/IO_block_io.png)

调用read，进程切换到阻塞态『直观层面，就是调用函数没返回，卡在调用那一行』，直到内核里对应的套接字缓存区存在数据并被复制到用户态的进程空间中。

## 非阻塞式I/O

![](/media/img/2016/IO_non_block_io.png)

调用read，在检查完内核缓存区后立即返回，存在数据则拷贝数据到用户态的进程空间后返回，不存在数据则立即返回。

## I/O多路复用

![](/media/img/2016/IO_multiplex.png)

通过类似select的接口调用去阻塞式的监听一个或多个套接字的状态『这里的阻塞指内核监听进程的阻塞』，如果任意一个套接字对应的内存缓存区存在数据则立即返回，若直到设定的监听时间结束依旧不存在数据也直接返回，根据不同的返回值决定是否调用read去读取内核态缓存区的数据『自然是监听结果为存在数据才去读取』。所以，从以上描述来看，理论上I/O多路复用并不会比阻塞式I/O更快，但它解决了阻塞式I/O需要使用昂贵的线程资源来支持多连接的问题，从而间接的解决了一定的性能问题。

### epoll

epoll是目前主流的I/O多路复用方案，相比于老的select和poll方案，epoll支持打开更多的socket描述符（只是相对于select），通过只扫描活跃socket代替全扫描，节省了时间，再加上内存和IO效率上的提升，使得epoll在性能上远优于select和poll。

epoll有两种工作方式：水平触发LT和边沿触发ET，LT是默认工作方式，即如果有一个文件描述符就绪了，内核会不断的通知你就绪状态，直到你采取一定的操作；而ET则是只通知一次，但如果不采取一定的操作，那新通知也不会投递。

## 信号驱动I/O

![](/media/img/2016/IO_signal_driven_io.png)

类似select将监听交给内核程序去处理，然后在套接字准备就位后内核发送一个预定义信号给进程，然后进程捕获信号后进行I/O调用，将内核缓冲区数据拷贝到进程空间来。

## 异步I/O

![](/media/img/2016/IO_async_io.png)

异步I/O的监听逻辑和信号驱动、I/O复用本质区别不大，都是将监听交给内核进程来做，但I/O复用和信号驱动在套接字准备就位后就停止，把I/O数据拷贝的工作留给应用进程来做，而异步是直到I/O数据拷贝完成才通知应用进程进行接下来的操作。


## 关于同异步概念的争执

同异步是针对特定对象而言的，本文针对的对象是应用进程，因此这里同异步主要取决于应用进程和内核交互时的阻塞状态，若是阻塞态即为同步操作，非阻塞态即为异步操作。