---
title: cherry-pick
layout: wiki
category: git
tag: [commit,指定,合并]
---

## 实例

```shell
# 合并34sdf的commit记录
git cherry-pick 34sdf

# 合并从34sdf到ghj5y的commit记录，包括34sdf
git cherry-pick 34sdf^..ghj5y

# 合并从34sdf到ghj5y的commit记录，不包括34sdf
git cherry-pick 34sdf..ghj5y
```
