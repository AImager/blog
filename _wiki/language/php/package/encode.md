---
layout: wiki
tags: [编码,转义符]
---



## 魔术引号

自动将进入PHP脚本的特殊字符进行转义，但5.4.0已经被移除，其中`magic_quotes_gpc`、`magic_quotes_runtime`、`magic_quotes_sybase`是用于运行时配置是否启用的参数，也跟着于5.4.0被废弃。

get_magic_quotes_gpc()用于检查当前的魔术引号状态，并未被废弃。

## 字符串函数

### htmlspecialchars

html字符串的转义处理。

其对应的解转义函数为`htmlspecialchars_decode()`。

### addslashes

一般用于数据库特殊字符转义，目前需要转义的有`'`、`"`、`\`、`NULL`。强烈建议使用数据库指定的转义函数，比如Mysql的`mysqli_real_escape_string()`。

其对应的解转义函数为`stripslashes()`。

### preg_quote

转义正则特殊字符，包括` . \ + * ? [ ^ ] $ ( ) { } = ! < > | : -`。

### quotemeta

转义字符`. \ + * ? [ ^ ] ( $ )`。


## 参考链接

* [htmlspecialchars](http://php.net/manual/zh/function.htmlspecialchars.php)
* [addcslashes](http://php.net/manual/zh/function.addslashes.php)
* [魔术引号](http://php.net/manual/zh/security.magicquotes.php)