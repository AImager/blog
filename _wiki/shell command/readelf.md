---
layout: wiki
tags: [ELF]
---

mac下对应的软件为greadelf

## 实例

```
# 查看elf文件头
readelf -h test.o
```

### -S

查看目标文件的section描述（对应section header table的描述）

### -h

查看目标文件的头文件属性

### -l

查看目标文件的program描述（对应program header table的描述）