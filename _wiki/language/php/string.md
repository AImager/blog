---
title: string
layout: wiki
category: php
tags: [字符串,heredoc,newdoc]
---



## 字符串变量解析

当PHP解析器遇到一个$符号时，它会和其它很多解析器一样，去组合尽量多的标识以形成一个合法的变量名。可以用花括号来明确变量名的界线。

```php
class name {
    public static function nihao() {
        return "ps";
    }
}

$ps = "nihao";

echo " {${name::nihao()}} ";        // 输出nihao
echo " {name::nihao()} ";        // 输出{name::nihao()}
```

注意上面的例子`${name::nihao()}`是作为一个单元来解析的，所以{}内要解析为变量，{后面必须要紧接$。

### 转义符

''转移符只有`\'`和`\\`

""转义符如下

* `\n`
* `\r`
* `\t`
* `\v`: 垂直指标符
* `\e`: Escape
* `\f`: 换页
* `\\`
* `\$`
* `\"`


## heredoc/newdoc

heredoc可用于换行字符串，它使用如下的句法结构，注意EOD可替换为包含字母、数字和下划线的任意字符串，但要首尾成对出现。还有一点注意的是，结束时所引用的标识符必须在该行的第一列。

有一个问题，就是;后面一定要换行，不然执行的时候会报错，目前还不知道原因。

```php
$str = <<<EOD
Example of string
spanning multiple lines \n
using heredoc syntax.
EOD;
```

newdoc和heredoc功能一样，句法区别在于它在开头的标识符上加了单引号。

```php
$str = <<<'EOD'
Example of string
spanning multiple lines
using heredoc syntax.
EOD;
```

heredoc和""一样支持变量解析和各种转义符（除了`\"`），而newdoc不支持变量解析，只支持`\\`转义。


## 参考链接

* [String 字符串](http://php.net/manual/zh/language.types.string.php#language.types.string.parsing.simple)