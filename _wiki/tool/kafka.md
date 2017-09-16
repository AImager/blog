---
title: kafka
layout: wiki
category: tool
tags: [队列,消息中间件]
---


~~~
# 列出所有topic
bin/kafka-topics.sh --list --zookeeper localhost:2181

# 创建topic
bin/kafka-topics.sh --create --zookeeper 192.168.103.104:2181 --replication-factor 1 --partitions 1 --topic test2

# 启动消费者消费
bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test1 --from-beginning
~~~


## 参考链接

* [Kafka文件存储机制](http://tech.meituan.com/kafka-fs-design-theory.html)
