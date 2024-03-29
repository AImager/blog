---
layout: wiki
tags: [mac,技巧]
---

## UI

* **滚轮**: 不想看到丑的滚轮，可以全局设置成滚动时才显示（这时候滚轮很好看）。**横向滚动**按住shift滚动滚轮即可。

### dock

```shell
# dock只显示当前运行程序
defaults write com.apple.dock static-only -bool TRUE; killall Dock
```

## 系统运行

### 性能监视器

* sysctl -n machdep.cpu.core_count：查看CPU总数
* sysctl -n machdep.cpu.brand_string：查看CPU型号、频率等

### 登录项位置

* /Library/
* /Library/Preferences/com.apple.loginwindow.plist
* /Library/Preferences/com.apple.loginitems.plist
* /Library/Preferences/loginwindow.plist
* /Library/LaunchAgents/
* /Library/LaunchDaemons/

**注**：上面是全局的，每个用户目录下也有这些项目


### 备份

```shell
# 禁止本地备份
sudo tmutil disablelocal

# 开启本地备份
sudo tmutil enablelocal
```

### 网络

网络位置，不同位置可用于定制不同网络配置（TCP/IP、DNS、代理等设置）



## 安全隐私

### 关闭SIP

1. 重启Mac，按住Command+R键直到Apple logo出现，进入Recovery Mode
2. 进入Utilities > Terminal
3. 执行csrutil disable，重启

### 允许任意来源

```shell
sudo spctl --master-disable
```

## 系统应用

### finder

* Command+Shift+G：快捷键"Go to Folder"，打开文件时也可用
* [Item "xxx" is used by macOS and cannot be opened](https://www.logcg.com/archives/2977.html)

### 截图

* **截屏**: 默认有两个快捷键，截全屏和选择截取，可以在键盘选项中设置。mac还可以截取某个应用窗口，方法是使用选择截取的快捷键，然后按空格鼠标编程相机图样，选择对应的窗口点击即可。


### spotlight

```shell
# spotlight禁用
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# spotlight启用
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

# 关闭索引
sudo mdutil -i off /

# 删除索引
sudo mdutil -E /

# 重建索引
sudo mdutil -i on /
```

* 重建Spotlight index索引：https://support.apple.com/en-us/HT201716
* 注意：现在无法搜索隐藏文件或者隐藏目录的文件



## 三方应用

### homebrew

homebrew不能使用root权限执行，所以有时候需要进行brew link到/usr/local下的时候会报权限错误，这时候homebrew建议的办法为`sudo chown -R $user:admin /usr/local`，其它的权限问题处理方式类似。


### mac-pkg

* [command line tools](https://developer.apple.com/download/more/)


### alfred

```shell
sudo codesign -f -d -s - /Applications/Alfred\ 3.app/Contents/Frameworks/Alfred\ Framework.framework/Versions/A/Alfred\ Framework
```

上述命令用于去除开机后alfred总是提示访问通讯录



## 技巧

### 快捷键

* control+U：删除当前行命令
* fn+Delete: 真正的向后delete




