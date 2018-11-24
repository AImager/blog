---
title: brew
layout: wiki
category: shell command
tags: [mac,包管理]
---

brew拥有自己的库，也有第三方库，第三方库的库使用tap管理。

brew自己使用编译的方式安装，而brew cask多是安装dmg/pkg，即更倾向于应用而不是cli的模式。

## 实例

### info

查看包的信息，包名必须正确


## useful-cask-package

* qlcolorcode: quicklook代码
* qlstephen: quicklook空文本
* quicklook-json
* qlimagesize: quicklook图片显示大小和分辨率

## 更新

* `brew upgrade ruby`: 更新某个包

## doctor

通过`brew doctor`命令检查brew的问题，常见的问题如下

### symlink, can't write

brew不能用root执行后，经常会出现不能写链接的情况，这时候就进行chown更改目录拥有者

### unlinked kegs in your Cellar

有些软件安装了，但是还没有进行link，所以执行`brew link package-name`