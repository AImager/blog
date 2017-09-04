---
title: mount
layout: wiki
category: shell command
tag: [磁盘,挂载]
---

## 实例

~~~Text
# ubuntu挂载mac共享文件
sudo mount -t cifs //192.168.1.116/FW-all-local ~/Desktop/ --verbose -o user="username",vers=3.0

# centos挂载mac共享文件
# 依赖cifs-utils
sudo mount -t cifs //192.168.100.20/FW-all ./ --verbose -o user="username",nounix,sec=ntlmssp,noperm
~~~
