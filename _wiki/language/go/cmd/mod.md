---
layout: wiki
tags: [版本控制,包管理]
---

1.11开始引入的包管理方式，用于替换GOPATH，1.13被设置为默认，一个完整的go.mod例子如下

```
module github.com/AImager/test

replace (
    github.com/ugorji/go => github.com/ugorji/go/codec v0.0.0-20190204201341-e444a5086c43
    github.com/BurntSushi/toml => /Users/username/Code/github.com/BurntSushi/toml
)

require (
	github.com/BurntSushi/toml v0.3.1
	github.com/DeanThompson/ginpprof v0.0.0-20190408063150-3be636683586
	github.com/bitly/go-simplejson v0.5.1-0.20181114203107-9db4a59bd4d8
    github.com/ugorji/go v0.0.0-00010101000000-000000000000
	github.com/didi/gendry v1.3.1 // indirect
	github.com/gomodule/redigo v2.0.0+incompatible
	gopkg.in/yaml.v2 v2.2.2
)

go 1.13
```

## go.mod

* module: 声明当前模块的名称
* go: 声明go版本
* replace: 重定向依赖
* require: 依赖管理，其中后面的部分格式为`vX.Y.Z[-time[-commit_id]]`，其中time格式为`年月日时分秒`的世界时间，commit_id有12位
* // indirect: 表示该package被子module/package依赖了，但是并没有被直接使用

main模块的replace才会生效，子模块的replace不会生效，参考[issues-36205](https://github.com/golang/go/issues/36205)以及官方的[mod声明](https://golang.org/cmd/go/#hdr-The_go_mod_file)

> Exclude and replace apply only in the main module's go.mod and are ignored in dependencies. See https://research.swtch.com/vgo-mvs for details.

## 命令

### init

初始化

## 对>v2的版本支持

## 参考连接

* [Anatomy of Modules in Go](https://medium.com/rungo/anatomy-of-modules-in-go-c8274d215c16)
* [The Principles of Versioning in Go](https://research.swtch.com/vgo-principles)
* [Go modules：最小版本选择](https://tonybai.com/2019/12/21/go-modules-minimal-version-selection/)