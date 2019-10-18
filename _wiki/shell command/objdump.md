---
title: objdump
layout: wiki
category: shell command
tags: [十六进制,反编译,ELF]
---

mac下对应的软件为gobjdump

## 实例

```shell
# 反编译ELF文件
objdump -d test.o
```

### -s

目标文件以十六进制显示

### -d

将指令段反编译

### -h

查看ELF格式