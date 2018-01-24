---
layout: wiki
tags: [平衡二叉树]
---

avl树是一棵二叉树，其任意节点满足：左右子树的高度相差不大于1。对于搜索等非修改操作，其代码和二叉树一样，而对于插入和删除等修改操作，为了保证『左右子树的高度相差不大于1』这个性质，导致其代码远复杂于普通二叉树。

## 插入

插入的主要思路是：在按常规操作插入二叉树后，如果新树违反『左右子树的高度相差不大于1』的原则，则通过『旋转』修正树。对于需要修正的情况进行归类，得到以下4种分类形式。

### LL

即插入位置为左儿子的左子树，进行LL/LeftLeft旋转，《数据结构与算法分析》把LL与RR统称为singleRotation，特别的LL命名为LeftSingleRotation。

![](/media/img/algorithms/LL.png)

### RR

即插入位置为右儿子的右子树，进行RR/RightRight旋转，相应的的RR被命名为RightSingleRotation。

![](/media/img/algorithms/RR.png)

### LR

即插入位置为左儿子的右子树，进行LR/LeftRight旋转，《数据结构与算法分析》把LR与RL统称为doubleRotation，特别的LR命名为LeftDoubleRotation。

![](/media/img/algorithms/LR.png)

### RL

即插入位置为右儿子的左子树，进行RL/RightLeft旋转，相应的的RL被命名为RightDoubleRotation。

![](/media/img/algorithms/RL.png)

## 删除

删除的大致思路如下

1. 从根节点向下递归进行删除操作，如果是待删除节点，进行操作2；如果不是，进行操作3
2. 如果左子树高于右子树，取左子树最大值替换待删除节点；否则，取右子树最小值替换待删除节点。
3. 如果待删除节点在左子树，递归左子树，否则递归右子树。递归操作后进行高度调整和转换。

## 更新

这个没有书籍给出单独的操作，但考虑可以先删除旧节点再插入新节点。





