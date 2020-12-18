---
layout: wiki
tags: [文件句柄,查看]
---

## 常规实现

遍历/proc下各进程目录的fd文件夹，会调用opendir、readdir、stat系统调用。

## 实例

```shell
# 查看本地打开某端口的进程情况
lsof -i :port

# mac下查看所有监听的端口
sudo lsof -nP -iTCP -sTCP:LISTEN

# 按照进程打开的句柄数量排序
lsof | awk '{print $2}' | sort | uniq -c | sort -nr | more
```