---
title: mac
layout: wiki
category: tips
tags: [mac,技巧]
---

## 操作集合

* Command+Shift+G：快捷键"Go to Folder"，打开文件时也可用
* control+U：删除当前行命令
* sysctl -n machdep.cpu.core_count：查看CPU总数
* sysctl -n machdep.cpu.brand_string：查看CPU型号、频率等

## 软件集合

* command line tool
* homebrew


## zshrc

~~~
alias timestamp="date +%s"
alias rm="echo 'please use\033[31m trash-put\033[0m command'; false"
export LC_ALL=zh_CN.UTF-8
~~~


## 参考链接

* [mac插件管理](http://bbs.feng.com/read-htm-tid-6891395.html)
