---
layout: wiki
tags: [远程,提交]
---

## 功能描述

## 实例

```
# 提交本地分支到远程
git push origin [branch_local:]branch_remote

# 删除远程的master分支，默认远程的default分支都是master，而远程分支是不让删除的，所以需要先修改default分支『一般通过gitlab或者github管理都是提供界面修改的』
git push origin --delete master

# 删除远程tag
git push origin --delete tag tagname
```

### -f

强制提交

### --delete

删除分支
