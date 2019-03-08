---
title: sort
layout: wiki
tags: [排序]
---

排序是经典而基础的算法问题，它也是很多高级算法的基石，所以重要性不言而喻。排序算法种类很多，最常见的一个说法是『十大排序算法』，包括复杂度为O(n^2)的选择排序、插入排序和冒泡排序，复杂度为O(n)的桶排序、基数排序和计数排序，以及复杂度为O(nlogn)的希尔排序、归并排序、堆排序和快速排序。下面对序列 $A_1,A_2...A_n$ ，以`升序`的方式描述各个排序算法。


## 冒泡排序

不断比较相邻的数，如果反序则调换两者的顺序，循环依次将最大值冒泡到后面，直到排序完成。

```c
void Bubbling_sort(int *previousInd , int n){
  int v,m,temp;
  for(m=n;m>=1;m--){
    for(v=1;v<m;v++){
      if(previousInd[v-1]>previousInd[v]){
        temp=previousInd[v];
        previousInd[v]=previousInd[v-1];
        previousInd[v-1]=temp;
      }
    }
  }
}
```

## 选择排序

从 $A_1 \sim A_n$ 中找出最小值和 $A_1$ 交换，然后从 $A_2 \sim A_n$ 中找出最小值和 $A_1$ 交换，循环下去，直到排序完成。

## 插入排序

循环序列，每次将 $A_{i+1}$ 插入到已排序的序列 $A_1 \sim A_i$ 中去。

## 桶排序

创建有限的排序桶（桶可用数组实现），将序列每个数放到不同的桶里面去（可以用整余数），然后对每个桶单独排序即得到整体结果。

## 基数排序

将数值按位切割，分别比较每一位，复杂度为O(kn)，其中k为数值位数。

## 计数排序

将值i的个数放到数组C的第i项，即i排序后的位置为 $sum(C_1 \sim C_{i-1})$ ，时间复杂度为O(k+n)，其中k为最大值。

**注**：建数组C的时候可以以最小值为偏移来做，这样可以节约C空间，也可以排序负数。

## 希尔排序

插入排序的改进版。先生成一个递增序列 $h_1, h_2, h_3 ... h_t$ ，该序列只需要满足 $h_1 = 1$ 。然后反序依次进行 $h_k$ 排序。 $h_k$ 排序即将 $h_{k+1}$ 排序序列作为待排序序列，然后将待排序序列分为 $h_k$ 组，每组均是序列号按 $h_k$ 递增的序列，接着对每组序列进行插入排序，从而得到 $h_k$ 排序序列。

以下为常用的递增序列

* shell序列: 满足 $h_1 = 1 , h_t = \left \lfloor N/2 \right \rfloor , h_k = \left \lfloor h_{k+1}/2 \right \rfloor$ 的序列，其中N为待排序序列长度。其最坏时间复杂度为 $O(N^2)$
* Hibbard序列: 满足 $h_1 = 1 , h_k = 2^k - 1$ 的序列。其最坏时间复杂度为 $O(N^{3/2})$

```c
void exchange(int* a, int* b) {
    a[0] = a[0] ^ b[0];
    b[0] = a[0] ^ b[0];
    a[0] = a[0] ^ b[0];
}

void shellSort(int* arr, int arrSize, int* increment, int incrementSize) {
    int temp, k;
    for(int i = 0;i<incrementSize;i++) {
        for(int j = increment[i];j<arrSize;j++) {
            temp = arr[j];
            for(k = j; k >= increment[i] ; k-=increment[i]) {
                if(temp < arr[k-increment[i]]) {
                    arr[k] = arr[k-increment[i]];
                } else {
                    break;
                }
            }
            arr[k] = temp;
        }
    }
}

int createShellIncrement(int* shellIncrement, int arrSize) {
    int i;
    shellIncrement[0] = (arrSize&(0xFFFFFFFE)) / 2;
    for(i = 1;;i++) {
        shellIncrement[i] = (shellIncrement[i-1]&(0xFFFFFFFE)) / 2;
        if(shellIncrement[i] == 1){
            break;
        }
    }
    return i+1;
}

int createHibbardIncrement(int* hibbardIncrement, int arrSize) {
    int returnSize, i;
    for(i = 0;; i++) {
        hibbardIncrement[i] = 2^(i+1) - 1;
        if(hibbardIncrement[i] < arrSize) {
            break;
        }
    }
    returnSize = i+1;
    for(;;i--) {
        exchange(&hibbardIncrement[i], &hibbardIncrement[returnSize - i - 1]);
        if(i == returnSize - i - 1 || i == returnSize - i) {
            break;
        }
    }
    return returnSize;
}
```

## 归并排序

归并排序主要是将一个长序列平分为两个短序列分别排序，然后合并，其中短序列的排序思路也是再次平分，也就是一个递归平分的过程。而对于两个排序好的短序列，采取顺序比较的方式合并，得到长排序数列最多需要2m-1次操作，最少需要m次操作，其中m为短序列的长度。

```c
void merge_sort_recursive(int* arr, int* new_arr, int len) {
    int left_len = (len&0xFFFFFE)/2;
    int i = 0,j = left_len, index = 0;
    if(len == 1) {
        new_arr[0] = arr[0];
        return;
    } else {
        merge_sort_recursive(arr, new_arr, left_len);
        merge_sort_recursive(&arr[left_len], &new_arr[left_len], len-left_len);
        while(1) {
            if(arr[i] > arr[j]) {
                new_arr[index] = arr[j];
                j++;
            } else {
                new_arr[index] = arr[i];
                i++;
            }
            index++;
            if(i==left_len) {
                for(;index<len;index++) {
                    new_arr[index] = arr[j];
                    j++;
                }
                break;
            } else if (j==len) {
                for(;index<len;index++) {
                    new_arr[index] = arr[i];
                    i++;
                }
                break;
            }
        }
        for(index=0;index<len;index++) {
            arr[index] = new_arr[index];
        }
    }
}
```

**注**：上面是采用递归的方式实现的，也有非递归的[实现](https://zh.wikipedia.org/wiki/%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F#C.E8.AA.9E.E8.A8.80)

## 堆排序

核心是建立最大堆，然后不断将最大值（即根节点）取出和当前序列末尾交换，同时维持剩余序列（当前序列除开末尾节点）为最大堆，直到排序结束。

```c
void swap(int* a, int* b) {
    int temp = a[0];
    a[0] = b[0];
    b[0] = temp;
}

/**
这里的index是数组下标
**/
void hold_max_heap (int* arr, int index, int len) {
    int left_child = (index+1)*2-1;
    int right_child = (index+1)*2;
    if(left_child >= len) {
        return;
    } else if (right_child >= len) {
        if(arr[index] < arr[left_child]) {
            swap(&arr[index], &arr[left_child]);
            hold_max_heap(arr, left_child, len);
        }
    } else if(arr[index] < arr[left_child] ||  arr[index] < arr[right_child]) {
        if(arr[left_child] > arr[right_child]) {
            swap(&arr[index], &arr[left_child]);
            hold_max_heap(arr, left_child, len);
        }else {
            swap(&arr[index], &arr[right_child]);
            hold_max_heap(arr, right_child, len);
        }
    }

}

void heap_sort(int* arr, int len) {
    int mid = (len&0xFFFFFE)/2;
    int i;
    for(i=mid-1;i>=0;i--) {
        hold_max_heap(arr, i, len);
    }
    for(i=len-1;i>0;i--) {
        swap(&arr[0], &arr[i]);
        hold_max_heap(arr, 0, i);
    }
}
```

## 快速排序

每次选择一个数作为参照对象（一般选择最后一个），然后通过partition寻找一个位置k，经过partition过程后，参照数 $A_n$ 被换到 $A_k$ ，且序列满足， $A_1 \sim A_{k-1}$ 均小于 $A_k$ ， $A_{k+1} \sim A_{n-1}$ 均大于 $A_k$ 。对 $A_1 \sim A_{k-1}$ 和 $A_{k+1} \sim A_{n-1}$ 递归执行上述过程，最终得到排序序列。

partition作为核心过程，其逻辑为建立一个分割游标（即当前k的值）和一个比较游标（即当前和参照数比较的数下标），一旦比较值<参照值，则将比较值和 $A_{k}$ 交换，同时分割游标k向右滑，直到比较过程完成后，将 $A_n$ 和 $A_k$ 交换。

**顺序统计学**中，寻找第k大/小的数，可以使用快排的partition思想，理想情况下可以很快的得到结果。

```c
void swap(int* a, int* b) {
    int temp = a[0];
    a[0] = b[0];
    b[0] = temp;
}

void partition(int* arr, int len) {
    int k = 0;
    if(len == 1 || len == 0){
        return;
    }
    for(int i=0;i<=len-2;i++) {
        if(arr[len-1] > arr[i]) {
            swap(&arr[k], &arr[i]);
            k++;
        }
    }
    swap(&arr[k], &arr[len-1]);
    partition(arr, k);
    partition(&arr[k+1], len-k-1);
}
```

注：上面是采用递归的方式实现的，也有非递归的[实现](https://zh.wikipedia.org/wiki/%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F#C.E8.AA.9E.E8.A8.80)

## 一些理论

### 稳定性

排序的稳定性指对于序列中相同的值，排序后的结果所在的位置是不是固定的，如果不固定则不稳定。

稳定排序

* 冒泡排序
* 插入排序
* 归并排序
* 基数排序
* 桶排序
* 计数排序

不稳定排序

* 选择排序
* 希尔排序
* 快速排序
* 堆排序

### 比较排序

通过比较两个值的办法确定位置的排序方法称为比较排序，比较排序的平均复杂度最小是O(nlogn)
