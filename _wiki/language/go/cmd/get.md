---
layout: wiki
tags: []
---

## get

```shell
# 下载包到gopath-src下
go get github.com/bitly/go-simplejson
```

### -u

加这个参数后，如果本地已经存在对应包，就不会进行更新

> To update Go modules present inside a module with go.mod file, use go get -u command. This command will update all the modules with the latest minor or patch version of the given major version (explained later). If you want to update only patch version even if the newer minor version is available, use go get -u=patch command instead.

## 参考链接

* [go get](http://wiki.jikexueyuan.com/project/go-command-tutorial/0.3.html)