---
title: deploy
layout: wiki
category: go
tag: [部署]
---

## go build

`go build main.go`得到二进制执行文件

## go install

`go install package_name`得到二进制文件并安装到源码对应的bin目录下

```
|-bin
|-pkg
|-src
    |-student
        |-index
            |-main.go
        |-controller
            |-filea.go
            |-fileb.go
        |-model
            |-modela.go
            |-modelb.go
```

如上图，使用`go build`即进入index目录下执行`go build main.go`即可（也可以使用绝对路径在外层目录执行build）。如果使用`go install`即执行`go install student\index`。