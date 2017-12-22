---
title: rmi
layout: wiki
category: docker
tag: [删除,tag,image,command]
---

```
# 删除镜像
docker rmi $id

# 如果对应镜像存在多个tag，则只删除tag
# 否则，删除镜像
docker rmi repos:tag
```
