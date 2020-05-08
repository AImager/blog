---
layout: wiki
tags: [系统调用]
---

glibc除了封装linux操作系统所提供的系统服务外，它本身也提供了许多其它一些必要功能服务的实现。

但并不是说进行系统调用一定要经过glibc，直接进行系统调用也是可行的，只不过不方便，比如go的实现就可以不依赖glibc（实际受到CGO_ENABLED值和代码依赖库的影响）。

* 如果仅仅是非net、os/user等的普通包，那么程序默认将是纯静态的，不依赖任何c lib等外部动态链接库；
* 如果使用了net这样的包含cgo代码的标准库包，那么CGO_ENABLED的值将影响你的程序编译后的属性：是静态的还是动态链接的；
* CGO_ENABLED=0的情况下，Go采用纯静态编译；
* 如果CGO_ENABLED=1，但依然要强制静态编译，需传递-linkmode=external给cmd/link。