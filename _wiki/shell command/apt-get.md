---
title: apt-get
layout: wiki
category: shell command
tags: [deb,ubuntu]
---

## 实例

```
# 卸载旧版本内核
sudo apt-get purge linux-image-xx-generic linux-headers-xx-generic
```

###  remove

移除程序

###  purge

彻底卸载（包括数据文件）

###  install

安装程序

###  reinstall

重装

###  -f install

自动安装缺少的依赖包

###  check

检查是否有损坏的依赖

###  update

更新程序

###  autoremove

自动卸载无用的包

###  clean

清除软件缓存

###  autoclean

清除旧缓存

###  upgrade

更新软件

###  dist-upgrade

更新所有软件（更新系统）

###  dselect-upgrade

使用dselect（debian的管理程序）升级

###  build-dep

通过编译安装时自动安装需要依赖的包（接需要编译的文件名）
