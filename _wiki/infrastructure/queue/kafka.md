---
layout: wiki
tags: [队列,消息中间件]
---


```shell
# 列出所有topic
bin/kafka-topics.sh --list --zookeeper localhost:2181

# 创建topic
bin/kafka-topics.sh --create --zookeeper 192.168.103.104:2181 --replication-factor 1 --partitions 1 --topic test2

# 启动消费者消费
bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test1 --from-beginning
```

## kafka的消费模型？

## kafka的存储模型？

## kafka为什么依赖zookepper


## 参考链接

* [Kafka文件存储机制那些事](https://tech.meituan.com/2015/01/13/kafka-fs-design-theory.html)
