---
layout: wiki
tags: [有序集合]
---

有序集合通过跳表实现，以下为5.0版本的zset结构

```c
/* ZSETs use a specialized version of Skiplists */
typedef struct zskiplistNode {
    sds ele;
    double score;
    struct zskiplistNode *backward;
    struct zskiplistLevel {
        struct zskiplistNode *forward;
        unsigned long span;
    } level[];
} zskiplistNode;

typedef struct zskiplist {
    struct zskiplistNode *header, *tail;
    unsigned long length;
    int level;
} zskiplist;

typedef struct zset {
    dict *dict;
    zskiplist *zsl;
} zset;
```

## 有序集合

字符串类型的有序集合，集合成员是唯一的。每个元素关联一个分数，通过分数排序。

```shell
# 将成员和其分数添加进集合
# O(M*log(N))， N 是有序集的基数， M 为成功添加的新成员的数量
zadd key score member

# 获取集合成员数量
# O(1)
zcard key

# 按分数从小到大获取指定排名区间的成员
# 加WITHSCORES表示显示分数
# O(log(N)+M)， N 为有序集的基数，而 M 为结果集的基数。
zrange key start end [WITHSCORES]
# 从大到小
zrevrange key start end [WITHSCORES]

# 在现有基础上增加分数
# O(log(N))
zincrby key increment member

# 返回指定分数区间的成员数量
# O(log(N))
ZCOUNT key min max

# 返回指定分数区间的成员，从小到大
# O(log(N)+M)， N 为有序集的基数， M 为被结果集的基数
ZRANGEBYSCORE key min max [WITHSCORES] [LIMIT offset count]
# 从大到小
ZREVRANGEBYSCORE key max min [WITHSCORES] [LIMIT offset count]

# 返回集合中member的排名，从小到大
# O(log(N))
zrank key member
# 从大到小
zrevrank key member

# 删除member
# O(M*log(N))，N 为有序集的基数， M 为被成功移除的成员的数量
# 单个复杂度为O(log(N))
ZREM key member [member ...]
```