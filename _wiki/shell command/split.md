---
layout: wiki
tags: [分割,文件]
---

## 实例

```
# 将old_file按每100行分割
# 分割后的文件采用new_file后接顺序字母串的方式命名
split -l 100 old_file new_file
```

### -l

按行数分割

### -b

按大小分割
