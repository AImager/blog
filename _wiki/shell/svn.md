---
layout: wiki
tags: [版本控制,subversion]
---

## 实例

```shell
# 拉取仓库某个目录下的文件
svn checkout http://repository.com/location --username=cong

# 状态
svn status

# 添加所有修改并提交到远程（包含git commit和push的功能）
svn add * --force

# 提交
svn commit -m 'init'

# 更新
svn update
```


## 参考链接

* [Git vs SVN commands](https://backlog.com/git-tutorial/reference/commands/)