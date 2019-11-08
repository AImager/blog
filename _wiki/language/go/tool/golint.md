---
layout: wiki
tags: [lint]
---

## golint

[golint](https://github.com/golang/lint)是官方维护的lint工具

## revive

[revive](https://github.com/mgechev/revive)是替代golint的第三方lint工具，功能是revive的父集，可配置化，下面是一些配置的rule

* var-naming: 命名规则，强制Id写成ID就是这个规则在生效（我一般关掉）
* exported: 导出元素的命名和注释规则（我一般也关掉）