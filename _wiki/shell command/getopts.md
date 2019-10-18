---
layout: wiki
tags: [参数解析]
---


## 实例

```
# 循环获取参数-e,-v,-o
while getopts :e:v:o: opt; do
    case $opt in
        e) ENVIRON=$OPTARG ;;
        v) VERSION=$OPTARG ;;
        o) OPER=$OPTARG ;;
    esac
done
```