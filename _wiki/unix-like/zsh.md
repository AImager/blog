---
title: zsh
layout: wiki
category: unix-like
tags: [zsh]
---


## zsh

* 使用zsh时，通过上下键回到某个历史命令后，操作ctrl-u清除输入，此时再按上下键，是以刚刚清除的那条历史命令作为基准点进行上下匹配的，最快修正基准点到末尾的方式是执行一个简短命令


## zshrc

~~~bash
alias timestamp="date +%s"
alias rm="echo 'please use\033[31m trash-put\033[0m command'; false"
export LC_ALL=zh_CN.UTF-8
~~~