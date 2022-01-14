---
layout: wiki
tags: [添加,暂存区]
---

## 功能描述

从工作区向暂存区添加文件

## 实例

```shell
# 添加所有有变化的文件，包括新建、删除、修改的文件
git add -A

# 解决『cygwin下add中文名文件乱码』
git config --global core.quotepath false

# 添加已经索引并修改或删除的文件
git add -u
```

### -i

交互模式

## 中英对照表

* Working Directory：工作区
* Staging Area：暂存区
* Repository：仓库


---
layout: wiki
tags: [查看记录]
---

## 功能描述

查看commit记录

## 实例

```shell
# 查看feature分支有但是master分支没有的commit信息
git log master..feature

# 查看文件的修改记录
git log --pretty=oneline file

# 比较分支的commit线的不同
git log --left-right dev...master
```

### --stat

包含文件变更记录

### --format

格式化信息显示

### --graph

图像形式显示

### --pretty=oneline

选定什么格式显示，包括oneline\short\full\fuller等


## 参考链接

* [git 对比两个分支差异](https://blog.csdn.net/u011240877/article/details/52586664)
