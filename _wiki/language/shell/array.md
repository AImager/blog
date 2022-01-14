---
layout: wiki
tags: [数组]
---

## 数组

```shell
arr=(A B C D 1 2 3 4)
for i in "${!arr[@]}";
do
    printf "%s\t%s\n" "$i" "${arr[$i]}"
done
```

### 数组长度

```shell
${#array[@]}
```

## 参考链接

* [Shell脚本数组用法小结](http://www.jb51.net/article/55253.htm)