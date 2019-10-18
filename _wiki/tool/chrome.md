---
layout: wiki
tags: [浏览器]
---

## Application

* Session Storage: 在一次回话期间有效的本地存储
* Local Storage: 不限时间的本地存储


## 内部标签

* `chrome://sync-internals/`: 查看同步状态，可以从traffice log查看同步日志


## tips

* 不同设备间同步的时候，不同的机器不能使用相同的代理，会出现SYNC_AUTH_ERROR
* `Shift + fn + Delete`删除地址栏记录
* `defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE`关闭mac双指前进后退