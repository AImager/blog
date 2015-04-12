---
title: 排序算法（上）
layout: post
tag: [排序,算法]
---


## 选择排序

**算法描述：**

C代码

```C
void Decision_sort(int *previousInd , int n){
  int v,m,j,min,temp;
  for(v=1;v<n;v++){
    min=previousInd[v-1];
    m=v;
    for(j=v+1;j<=n;j++){
      if(previousInd[j-1]<min){
        min=previousInd[j-1];
        m=j;
      }
    }
    temp=previousInd[v-1];
    previousInd[v-1]=previousInd[m-1];
    previousInd[m-1]=temp;
  }
}
```


## 插入排序

**算法描述：**

C代码

```C
void Insert_sort(int *previousInd , int n){
  int m,v,k,temp;
  for(m=2;m<=n;m++){
    temp=previousInd[m-1];
    for(v=1;v<=m-1;v++)
      if(previousInd[m-1]<previousInd[v-1])
        break;
    for(k=m-1;k>=v;k--)
      previousInd[k]=previousInd[k-1];
    previousInd[v-1]=temp;
  }
}
```

## 冒泡排序

**算法描述：**

C代码　　

```C
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
