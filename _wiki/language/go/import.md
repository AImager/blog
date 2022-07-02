---
layout: wiki
tags: [包,import]
typora-root-url: ../../../../blog
---

![](/media/.img/go_import.png)

`import _`表示只执行`init()`函数，而不能使用包中的变量

* 同一个目录下的文件package必须设置一样
* 同意目录下的文件作用域互通，即不需要相互import即可引用各自的变量、函数等
* `go build`必须包含所有`package main`下面的文件
* 目录名可以和目录下文件的`package`名不一样，而import的时候是使用的目录名，所以会出现import和使用的时候不一样，不过建议名称设置成一样。


```
|-bin
|-src
    |-Test
        |-main.go
        |-test.go
```

* `go build Test/*`得到main二进制执行文件，位于执行命令的目录下
* `go install Test`得到Test二进制执行文件，位于bin目录下
* 当`main.go`和`test.go`设置的`package`不是`main`的时候，执行`go install`和`go build`都不会得到结果，即执行`go build`寻找的输入文件所有`package main`的，而执行`go install`寻找的是`package`目录下所有`package main`的


## get

```shell
# 下载丢失的包，但不会更新已经存在的包
go get -u github.com/mgechev/revive
```

## 参考链接

* [golang之package](https://studygolang.com/articles/5831)
* [理解Golang包导入](https://tonybai.com/2015/03/09/understanding-import-packages/)
* [go get命令——一键获取代码、编译并安装](http://c.biancheng.net/view/123.html)
