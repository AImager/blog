---
title: mac
layout: wiki
category: unix-like
tags: [mac,技巧]
---

## 操作集合

* Command+Shift+G：快捷键"Go to Folder"，打开文件时也可用
* control+U：删除当前行命令
* sysctl -n machdep.cpu.core_count：查看CPU总数
* sysctl -n machdep.cpu.brand_string：查看CPU型号、频率等





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


## mac-pkg

~~~
* command line tools		url: https://developer.apple.com/download/more/
~~~

## 截屏

默认有两个快捷键，截全屏和选择截取，可以在键盘选项中设置。mac还可以截取某个应用窗口，方法是使用选择截取的快捷键，然后按空格鼠标编程相机图样，选择对应的窗口点击即可。




## 参考链接

* [mac插件管理](http://bbs.feng.com/read-htm-tid-6891395.html)
