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

# 添加所有修改
svn add * --force

# 提交
svn commit -m 'init'
```