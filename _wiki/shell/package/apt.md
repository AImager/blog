---
layout: wiki
tags: [deb,ubuntu,apt-get,apt-cache]
---

apt-cache和apt-get是历史的命令，后面统一到apt命令下

## 实例

```shell
# 正则匹配搜索package，搜索范围只限名字
sudo apt search --names-only "php{2}"

# 卸载旧版本内核
# uname -r 可以查看当前使用的内核
# dpkg --get-selections|grep -E "^linux-(image|modules)" 可以查看当前有多少内核文件
sudo apt purge linux-image-xx-generic linux-headers-xx-generic
```

## apt-cache支持的命令


### depends

查看包依赖哪些包

### rdepends

查看包被哪些包依赖

### show

查看包相关信息

### search

查找包（模糊查找）



## apt-get支持的命令

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

## 参考链接

* [Linux中apt与apt-get命令的区别与解释](https://blog.csdn.net/maizousidemao/article/details/79859669)