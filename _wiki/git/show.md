---
title: show
layout: wiki
category: git
tags: [查看修改]
---

## 实例

~~~
# 查看某个commit的详细修改信息
# commit_id只需要唯一匹配前缀就可以
git show commit_id

# 查看某文件在commit_id时的内容
git show commit_id:file_name

# 显示分支文件内容
# 注意要看某个分支某次提交的某个文件内容
# 则只需要提供commit_id就可以了
# 因为commit_id才是唯一标识一次修改的
git show branch_name:file_name
~~~
