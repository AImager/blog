---
title: Git与Github基础参考手册
layout: post
tag: [参考手册,Git,Github]
---


Git是一个分布式版本控制系统，用户用Git控管文件的时候，默认看到四个空间——本地仓库、暂存区（添加进去的文件会被跟踪）、索引库、远程仓库


## 文件状态

Untracked files：未添加到暂存区的文件
Changes not staged for commit：已添加到暂存区但本地仓库中修改/删除的文件，modified表示修改，deleted表示删除
Changes to be committed：已添加到暂存区但未提交的文件，modified表示已修改，deleted表示已删除，new file表示新文件


### 空间

![](/media/img/2013/areas.png)

上图取自于官方，用来表示本地仓库的各个空间和交互关系，下面分别对图中的各条目进行解释

```
Working Directory： 当前的工作目录——除开.git
Staging Area： 索引库，对应的实体文件（index）也在.git目录中
.git directory： 为区别理解，即不包括索引库的.git目录
Stage Fixes： 将修改添加到
Commit：
Checkout the project：
```



## <command>列表：

```
config：设置信息
    --local：修饰符，指定设置当前项目，默认选项，设置保存在当前项目.git/config文件中
    --global：修饰符，指定设置当前账户，设置的信息一般存储在当前用户目录的.gitconfig文件
    --system：修饰符，指定设置全局账户，设置的信息一般存储在/etc/gitconfig文件中

    user.name <name>：设置用户名称
    user.email <email>：设置用户邮件


init：初始化当前目录本地仓库根目录


diff：比较区别
    []：比较本地仓库和暂存区都存在的文件的区别
    --staged：比较暂存库和索引库都存在的文件的区别




git add [-option] <file ...>：从Working Directory向Staging Area添加文件
  -i：交互模式

git rm [-option] <file ...>：在Staging Area执行rm操作

git mv [-option] <source> <target>：在Staging Area执行mv操作

git add/rm/mv：将当前暂存库添加/删除/移动文件，支持通配符
    <args>：基础参数同bash

commit：添加记录（将暂存区的信息提交到索引库）
    []：将当前暂存区中已有文件的暂存区状态添加到索引库
    -a：将本地仓库修改或删除且已添加到暂存区的文件提交到索引库，不过新文件不提交
    -m <msg>：将本次提交的信息命名为msg

log：查看commit记录


branch：分支操作
    []：显示所有本地分支，其中当前操作分支前面用*标识
    -d：
    -D <branch>：不合并分支的前提下删除branch分支

checkout
    <branch>：切换到branch分支
    -b <new-branch>：新建新分支new-branch并切换到新分支
    -B <new-branch>：新建新分支new-branch并切换到新分支，如果分支已存在，就初始化该分支为新分支


clone：克隆远程仓库到本地（注意：只能克隆仓库，单个文件和目录都不行，需要拖单个文件使用wget工具）
    <repository>：仓库位置，有url、ssh、git等多种模式可选
    [dirname]：克隆到本地文件夹dirname

help：git帮助
    []：全局帮助，命令列表
    <command>：查看想关命令的帮助

status：查看状态
    []：查看所有状态

merge：合并操作


reset：回到某状态
    --hard <commit_id>：所有信息回退到commit_id级别，commit_id是提交的commit的哈希值
    --soft <commit_id>：保留本地仓库源码和暂存区信息，但回退索引库到commit_id级别
    --mixed <commit_id>：不加参数的默认版本，保留本地仓库源码，但回退暂存区和索引库到commit_id级别

push：发布
    <repository>：将最后commit的内容发布到远程仓库

pull：更新本地仓库到远程仓库最新版本（直接合并）


fetch：更新本地仓库到远程仓库最新版本（不直接合并）


reflog

tag
```
