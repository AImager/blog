---
title: apt
layout: wiki
category: linux
tags: [Ubuntu,包管理]
---  
    

## OPTIONS

### -get remove

移除程序
            
### -get purge  

彻底卸载（包括数据文件）
            
### -get install

安装程序

### -get reinstall

重装
            
### -get -f install

自动安装缺少的依赖包
            
### -get check

检查是否有损坏的依赖

### -get update

更新程序
            
### -get autoremove

自动卸载无用的包

### -get clean

清除软件缓存

### -get autoclean

清除旧缓存

### -get upgrade

更新软件

### -get dist-upgrade

更新所有软件（更新系统）

### -get dselect-upgrade

使用dselect（debian的管理程序）升级

### -get build-dep

通过编译安装时自动安装需要依赖的包（接需要编译的文件名）

### -file search

查找文件属于哪个包

### -cache depends

查看包依赖哪些包

### -cache rdepends

查看包被哪些包依赖

### -cache show

查看包相关信息

### -cache search

查找包（模糊查找）