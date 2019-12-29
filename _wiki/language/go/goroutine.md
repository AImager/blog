---
layout: wiki
tags: [协程]
---

## 协程上下文切换的时机 [^1]

* The use of the keyword go
* Garbage collection
* System calls
* Synchronization and Orchestration
* runtime.Gosched
* already run 100ms and call an un-inline function

第5、6点是额外加的，第6点存疑

## 疑问

time.Sleep会让线程sleep么？如果sleep的话，超过gomaxproces个sleep后，就没有线程可用了？

## 参考链接

* [也谈goroutine调度器](http://tonybai.com/2017/06/23/an-intro-about-goroutine-scheduler/)
* [goroutine 背后的系统知识](http://www.sizeofvoid.net/goroutine-under-the-hood/)
* [关于Go语言调度器实现细节的补充分析](http://amalcao.github.io/blog/2014/05/16/guan-yu-goyu-yan-diao-du-qi-shi-xian-xi-jie-de-bu-chong-fen-xi/)
* [Go 语言对OS系统调用的处理](http://amalcao.github.io/blog/2014/05/22/go-yu-yan-dui-osxi-tong-diao-yong-de-chu-li/)
* [Go 调度器相关数据结构](https://tiancaiamao.gitbooks.io/go-internals/content/zh/05.1.html)
* [Golang - 调度剖析](https://segmentfault.com/a/1190000016038785?#articleHeader5)
* [Scheduling Multithreaded Computations by Work Stealing](http://supertech.csail.mit.edu/papers/steal.pdf)

## 脚注

[^1]: [Scheduling In Go : Part II - Go Scheduler](https://www.ardanlabs.com/blog/2018/08/scheduling-in-go-part2.html)