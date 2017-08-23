---
title: btree
layout: wiki
category: algorithms
tags: [BTree,B+Tree]
---


## BTree

BTree中文名为平衡多路查找树，以下为一个m（m>=2）阶BTree的定义：

1. 树中每个结点最多含有m个孩子
2. 除根结点和叶子结点外，其它每个结点至少有\( \lceil \frac{m}{2}  \rceil \)个孩子
3. 若根结点不是叶子结点，则至少有2个孩子
4. 一个非叶子节点若有k个子节点，则其也包含k-1个关键字
5. 所有叶子结点都出现在同一层，叶子结点不包含任何关键字信息



## B+Tree

B+Tree在BTree的基础上添加了一条，用来快速连续的读取数据（此时，只有叶子节点用来存储真实数据）

* 叶子节点的最后一个指针指向下一个叶子节点的第一个关键字



## 参考链接

[MySQL索引背后的数据结构及算法原理](http://blog.jobbole.com/24006/)


## 问题

含varchar的btree复合索引实现？