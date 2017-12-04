---
title: vim
layout: wiki
category: tool
tag: [vim]
---

这篇文章介绍的部分只保证在类似ssh的终端场景下能顺畅的使用vim，事实上，我用atom~

vim中一个被编辑的文件叫一个缓冲区，缓冲区存储了当前文本的副本、一些设置以及和该缓冲区有关的其它东西

## 缓冲区的三种状态

* Active：内容被载入，且被显示在窗口
* Hidden：内容被载入，但未被显示在窗口
* Inactive：不出现在窗口中，内容也未被载入


## shell下命令通用格式:

```
vim [option] [filelist]
  []：直接打开vim编辑器
  -b：以二进制形式打开
```


## 一般模式

```
nh、nj、nk、nl：左、下、上、右移n位，缺省数字为1
u：撤销操作，撤销到原始状态会提示
dd：剪切整行
yy：复制整行
v：选择文本，然后按d剪切，按y复制，按p粘贴
P：粘贴
x：删除
0/$：移动到本行开头/末尾
nG：移动到第n行
/str：向下匹配str字符串，按n/N重复匹配下一个/上一个
?str：向上匹配str字符串，按n/N重复匹配下一个/上一个
```


## 命令模式（以:作为开头）

```
[m,n]s/str1/str2/[g]：查找str1并替换为str2；m,n表示查找的起止行数，缺省为当前行；g表示替换查找到的所有str1，缺省只替换查找到的第一个；
w [filename]：保存文件
q：退出当前编辑文档，加!表示不保存直接退出
n：进行下一个文档的编辑
open [filename]：打开文档
u：撤销前一个操作
U：撤销对整行的操作
%!xxd：将文件以16进制形式显示（可编辑，只有编辑16进制位置才有效 ，右边的ASCII字符只是参考作用）
%!xxd -r：修改完后换回二进制形式
```

#### 设置（对当前用户的~/.vimrc、全局的vimrc在Vim安装目录下）：

```
# 设置显示行号
set nu

# 设置自动缩进
set autoindent

# 设置自动缩进格数
set shiftwidth=2

# 定义tab格数
set tabstop=2

# 设置实际tab格数
set softtabstop=2

# 开启高亮
syntax on

# 设置C语言缩进
set cindent
```
