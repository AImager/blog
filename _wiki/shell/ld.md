---
layout: wiki
tags: [编译链接]
---

## 实例

```shell
# 在64位系统上链接test.o成test
ld -m elf_i386 -s -o test test.o
```