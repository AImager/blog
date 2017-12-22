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


## 备份

```
# 禁止本地备份
sudo tmutil disablelocal

# 开启本地备份
sudo tmutil enablelocal
```

## 网络

网络位置，不同位置可用于定制不同网络配置（TCP/IP、DNS、代理等设置）


## 关闭SIP

1. 重启Mac，按住Command+R键直到Apple logo出现，进入Recovery Mode
2. 进入Utilities > Terminal
3. 执行csrutil disable，重启


## 允许任意来源

```
sudo spctl --master-disable
```


## 性能优化

```
# spotlight禁用
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# spotlight启用
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
```


## homebrew

homebrew不能使用root权限执行，所以有时候需要进行brew link到/usr/local下的时候会报权限错误，这时候homebrew建议的办法为`sudo chown -R $user:admin /usr/local`，其它的权限问题处理方式类似。


## mac-pkg

* [command line tools](https://developer.apple.com/download/more/)

## 截屏

默认有两个快捷键，截全屏和选择截取，可以在键盘选项中设置。mac还可以截取某个应用窗口，方法是使用选择截取的快捷键，然后按空格鼠标编程相机图样，选择对应的窗口点击即可。




## 参考链接

* [mac插件管理](http://bbs.feng.com/read-htm-tid-6891395.html)
