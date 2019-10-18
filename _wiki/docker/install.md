---
layout: wiki
tags: [安装]
---

docker是基于Linux的虚拟技术做的，所以mac和windows都是必须在一个linux虚拟机上装docker，只不过docker的一些列工具软件集成简化了这个流程。以mac下为例子，最初使用的是Toolbox，这是个集成docker-machine、docker、docker-compose等工具的工具箱，docker-machine用于控制Virtualbox虚拟机，以保证boot2docker在虚拟机上的运行，从而提供类似docker-daemon的环境。而后使用docker for mac这个mac本地化软件进一步简化了流程，一键化操作。

## 参考链接

* [Get started with Docker for Mac](https://docs.docker.com/docker-for-mac/)
* [Mac部署Docker环境](http://www.jianshu.com/p/5d3f6b40b132)
* [Docker for Mac vs. Docker Toolbox](https://docs.docker.com/docker-for-mac/docker-toolbox/)
* [Get Docker CE for CentOS](https://docs.docker.com/install/linux/docker-ce/centos/)