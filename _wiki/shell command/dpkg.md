---
title: dpkg
layout: wiki
category: shell command
tags: [deb,ubuntu,debian,包管理]
---

## 实例

~~~Text
# 备份当前系统安装的所有包的列表
dpkg --get-selections | grep -v deinstall > ~/somefile

# 从上面备份的安装包的列表文件恢复所有包
dpkg --set-selections < ~/somefile sudo dselect
~~~


### -l

查看软件包信息，缺省值为所有已安装的包信息

### -S

查询系统中某个文件属于哪个软件包

### -L

查询系统中已安装的软件包所安装的位置

### -P

全部卸载(但是还是不能解决软件包的依赖性的问题)

### -i

安装deb包
