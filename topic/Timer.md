---
title: 定时器
layout: post
tags: [时间轮,最小堆]
---

```go
func main() {
	wg := sync.WaitGroup{}
    wg.Add(1)
    time.AfterFunc(time.Second, func(){wg.Done()})
	fmt.Println("test")
	wg.Wait()
}
```

上面的代码很简单，即go语言里面的定时器使用方法——1s后触发某个函数的执行，

## 定时器管理实现

### 链表

n个已存在定时器

链表的实现方式最为简单，即每次延迟信号来了之后，遍历链表，如果时间到期了，就从链表删除该元素，并唤醒对应触发方法。链表实现的主要问题在于寻找到期定时器的时间复杂度为`O(n)`，考虑下tcp都有超时逻辑，对于动辄几千上万连接的web服务，这样的复杂度显然是没法满足性能要求的。

### 层级时间轮

m层级时间轮（m固定，且一般很小），n个已存在定时器

![时间轮](/media/.img/timewheel.png)

插入时间复杂度：O(1)（最多m次运算）
查找到期定时器复杂度：O(1)（最多m次运算）

层级时间轮的实现虽然复杂度都为O(1)，但在查找过程中需要做一些额外的工作，当低层级轮转回起始点的时候，高一级的层级轮相应的需要转动一格，而对应格里面存的所有定时器都需要插入到低层级轮里面去。因此，对于m层级时间轮上的定时器，其实际操作次数是m次（移动m-1次，查找一次）。

当定时时间超过了时间轮支持的最长时间，可以把定时器放在一个额外链表里面，最高级时间轮每转一圈，就需要遍历这个额外链表，把链表里时间小于时间轮最长时间的定时器加回到时间轮里面来，某种意义上就是链表合层级时间轮的混合实现，从这里也可以看出来，层级时间轮更适合短时间内的高并发定时。

### 最小堆

n个已存在定时器

插入时间复杂度：O(lgn)
查找到期定时器复杂度：O(1)

## golang中的定时器实现

```go
// 定时器结构体
type timer struct {
    // 定时器所在的最小堆，数组实现
    tb *timersBucket // the bucket the timer lives in
    // 定时器在数组中的索引，0即表示在最小堆的根，即最先被唤醒
	i  int           // heap index

	// Timer wakes up at when, and then at when+period, ... (period > 0 only)
	// each time calling f(arg, now) in the timer goroutine, so f must be
    // a well-behaved function and not block.
    // 定时器到期时间，ns
    when   int64
    // 创建计时器距到期时间的间隔时间
    period int64
    // 到期唤醒函数
    f      func(interface{}, uintptr)
    // 到期channel
    arg    interface{}
	seq    uintptr
}
```

## 参考链接

* [完全兼容golang定时器的高性能时间轮实现](http://xiaorui.cc/2019/09/27/%E5%85%BC%E5%AE%B9golang-time%E5%AE%9A%E6%97%B6%E5%99%A8%E7%9A%84%E6%97%B6%E9%97%B4%E8%BD%AE%E5%AE%9E%E7%8E%B0/)
* [5.3 定时器](https://draveness.me/golang/concurrency/golang-timer.html)
* [层级时间轮的 Golang 实现](http://russellluo.com/2018/10/golang-implementation-of-hierarchical-timing-wheels.html)
* [Faking time](https://blog.golang.org/playground)
