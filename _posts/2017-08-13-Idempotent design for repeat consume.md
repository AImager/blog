---
title: 解决重复消费的幂等性设计
layout: post
tags: [重复消费,幂等]
typora-root-url: ../../blog
---

幂等的概念来自于数学，意指某元素在某操作下自运算多次，结果依然为它自己。比如0在`+/-/*`操作下都是幂等的，1在`*`操作下是幂等的。类比到计算机系统里面去，这样的概念不太行得通，所以在计算机系统里，幂等指任意次执行相同的操作所产生的影响和第一次一样。一个比较典型的应用幂等的场景是：在面向服务的架构下，网络环境等因素导致不是每一次调用都是成功的，这样在重试的基础上，就需要保证相同的多次调用只完成最初一次调用的效果，即避免重复消费。

避免重复消费的核心就是为请求设置guid，通过互斥锁和标记保证同一个请求只影响系统一次。逻辑很简单，但是实现上有以下两个需要注意的问题。

第一个需要注意的问题是判断请求是否已执行的时候，不要使用数据库进行判断。很多需要做幂等性设计的系统，经常会把guid写入数据库，理论上这个时候通过select判断是个即简单又清晰的方案，但实践中还是会存在重复消费的问题，分析原因发现，在A请求进行select+insert的期间，若相同guid的B请求提交了select，那B判断的结果也是未执行，从而导致insert重复。即采用数据库判断会存在一个长度为select+insert的重复窗口期，这在高并发下是不可接受的。那么这个时候可以使用redis做锁介质，insert前先设置guid-key拿到互斥锁，完成后释放，这样就可以完全避免重复消费的问题。

```php
if (setnx(guid))    // setnx表示不存在才设置，存在时返回0
    return;
else
    insert;
```

第二个需要注意的问题是请求一定要可结束，如果一个请求长期卡住，尤其是卡在insert代码段，那重试请求将总是return，这样不仅导致该请求无法完成，整体上也会影响业务的正常运作。以LNMP架构方案为例子，如果采用同步运行在PHP-FPM上的方式，只需调整PHP-FPM的超时时间即可。若采用异步后台server的方式处理，则需要自己控制进程/线程的超时时间。
