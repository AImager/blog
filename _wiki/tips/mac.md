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


## zshrc

~~~
alias timestamp="date +%s"
alias rm="echo 'please use\033[31m trash-put\033[0m command'; false"
export LC_ALL=zh_CN.UTF-8
~~~


## 关闭SIP

1. 重启Mac，按住Command+R键直到Apple logo出现，进入Recovery Mode
2. 进入Utilities > Terminal
3. 执行csrutil disable，重启


## 允许任意来源

~~~Text
sudo spctl --master-disable
~~~


## 性能优化

~~~Text
# spotlight禁用
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# spotlight启用
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
~~~

## brew-package

~~~
* qlcolorcode（quicklook）
* qlstephen（quicklook空文本）
* qlmarkdown（quicklook）
~~~

## mac-pkg

~~~
* command line tools		url: https://developer.apple.com/download/more/
~~~

## 其它

* 使用zsh时，通过上下键回到某个历史命令后，操作ctrl-u清除输入，此时再按上下键，是以刚刚清除的那条历史命令作为基准点进行上下匹配的，最快修正基准点到末尾的方式是执行一个简短命令


## 参考链接

* [mac插件管理](http://bbs.feng.com/read-htm-tid-6891395.html)
