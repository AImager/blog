---
layout: wiki
tags: [远程,debug]
---


```shell
# 远程开启程序并提供监听debug端口
dlv --listen=:8101 --headless=true --api-version=2 --accept-multiclient exec ./demo
# 本地监听debug
dlv connect www.example.com:8101
```

## 参考链接

* [使用 dlv + GoLand 远程调试Go程序](https://juejin.im/entry/5d5ce39ef265da039a288b85)