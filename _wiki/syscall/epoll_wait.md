---
layout: wiki
tags: [多路复用]
---


```c
#include <sys/epoll.h>

int epoll_wait(int epfd, struct epoll_event *events, int maxevents, int timeout);
```

epoll_wait() 系统调用等待由文件描述符 epfd 引用的 epoll 实例上的事件。events 指针指向的内存包含对调用者有效的事件。当达到 maxevents 时 epoll_wait() 会返回，其中 maxevents 参数必须大于零。

调用等待最长时间是 timeout 毫秒。指针 timeout 为 -1 让 epoll_wait() 无限期地等待，若指定 timeout 为零时即使在没有事件有效 epoll_wait() 也会立即返回(返回值是零)。

epoll_wait() 在内核版本 2.6 加入。glibc 从版本 2.3.2 开始支持。

常规的epoll用法伪码如下：

```shell
# 伪码
while (1) {
    len = epoll_wait();
    for (i 1:len) {
        if (events[i]) {
            recev();    # 内核态数据拷贝到用户态，同步阻塞
            do_something();
        }
    }
}
```