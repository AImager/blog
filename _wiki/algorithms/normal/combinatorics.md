---
title: combinatorics
layout: wiki
tags: [组合,排列,幂]
---

## 排列

从N个元素中取M个元素做全排列，共有 $A_{N}^{M}$ 种排列方法。

```c
void arrangement(int depth, int * index_arr) {
    int symbol = 0;
    if(depth == M) {
		for(int i = 0; i < M ;i++) {
			printf("%d ",index_arr[i]);
		}
		printf("\n");
        return;
    }
    for(int i=0;i<N;i++) {
        index_arr[depth] = i;
        for(int j=0;j<depth;j++) {
            if(index_arr[depth]==index_arr[j]) {
                symbol = 1;
            }
        }
        if(symbol == 1){
            symbol = 0;
            continue;
        }
        arrangement(depth+1, index_arr);
    }
}
```

depth是深度，初始为0，index_arr为索引数组，初始为M维空数组。

注：以上代码输出的是索引，因此对于N元素原数组，只需把索引作为下标带入即可得到原值。


## 组合

从N个元素中取M个元素，共有 $C_{N}^{M}$ 种取法，输出的时候因为不同顺序的相同元素总是算作同一组，所以一般都是按大小或者原排列顺序输出。输出下标

```c
void combination(int depth, int * index_arr, int pre_index) {
    if(depth == M) {
		for(int i = 0; i < M ;i++) {
			printf("%d ",index_arr[i]);
		}
		printf("\n");
        return;
    }
    for(int i=pre_index; i <= N-M+depth; i++) {
        index_arr[depth] = i;
        combination(depth+1, index_arr, i+1);
    }
}
```

参数和输出与排列基本相同，只是多了pre_index，它表示前一项的索引下标。

## 幂

每次从N个元素中取一个元素，然后放回去，取M次，共有 $N^M$ 种排列方法

```c
void power(int depth, int * index_arr) {
    if(depth == M) {
		for(int i = 0; i < M ;i++) {
			printf("%d ",index_arr[i]);
		}
		printf("\n");
        return;
    }
    for(int i=0;i<N;i++) {
        index_arr[depth] = i;
        power(depth+1, index_arr);
    }
}
```