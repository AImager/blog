---
layout: wiki
tags: [子模块]
---

submodule可以独立管理代码，但新提交需通过commit注册到父项目，这样才能使重新clone-init-update后，子模块的代码保证最新。但如果你想子模块固定在某个commit-id处，则该commit-id后的新提交均无需在父项目注册，不过会发现git status的时候总是有个new commits碍眼，那么可以在.gitmodules文件中添加`ignore = all`条目，忽略后面子模块新提交的注册提醒。


## 实例

```shell
# 添加子模块到src/library目录
git submodule add http://name@url.git src/library
```

### add

添加子模块

### init

初始化子模块配置，即在.git/config添加submodule的配置。在clone下父项目后，必须首先执行该命令，否则例如update等命令会因为缺乏配置而无法正常工作

### update

更新子模块到父项目的注册commit-id为止。注意如果子模块实际commit-id更新，那么执行update命令后子模块会checkout到注册commit-id新分支，而更新的提交保留在master里面，但未索引和提交的部分都会丢失。

### status

查看子模块在父项目的注册commit-id，同时，若子模块实际commit-id更新，则显示的commit-id前会出现+，相反会出现-


## 参考链接

* Git权威指南
