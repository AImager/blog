---
layout: wiki
tags: [合并,补丁,patch]
---

## 功能描述

merge只和合并分支的最后一次commit后的数据有关，而rebase是把commit信息先消除，然后作为补丁依次打进去。


## 实例

```
# 解决完冲突后继续rebase操作
git rebase --continue

# 忽略冲突
git rebase --abort
```




## 参考链接

* [Merge、Rebase的选择](https://github.com/geeeeeeeeek/git-recipes/wiki/5.1-%E4%BB%A3%E7%A0%81%E5%90%88%E5%B9%B6%EF%BC%9AMerge%E3%80%81Rebase%E7%9A%84%E9%80%89%E6%8B%A9)
* [分支的衍合](https://git-scm.com/book/zh/v1/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%9A%84%E8%A1%8D%E5%90%88)
