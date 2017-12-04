---
title: atom
layout: wiki
category: tool
tag: [编辑器]
---

## find and replace

使用`!`排除不需要包含的文件或者目录

## 快捷键

使用`'cmd-q': 'unset!'`取消快捷键的设置

* `cmd-z`: undo
* `cmd-y`: redo
* `cmd-[`: 整体向左缩进一个单位
* `cmd-]`: 整体向右缩进一个单位

## ss代理

测试后发现只支持http/https代理，但是mac下ss只支持http代理，所以设置文件.atom/.apmrc如下

```
strict-ssl=false
https-proxy=http://127.0.0.1:port
http-proxy=http://127.0.0.1:port
```

ss-port一般是1087。可以把设置文件sync-settings里面去

## atom grammar

atom的grammar用的是textmate的标记方式，参考[Language Grammars](http://manual.macromates.com/en/language_grammars)。但是官方文档很少，且官方没有用于create language的模板和工具，这方面就比vscode差多了。不过也可以基于第三方写的[language-generic-config](https://atom.io/packages/language-generic-config)进行修改。当然，如果只是想该主题，最简单就是修改自己的stylesheet。