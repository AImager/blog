---
title: 组合
layout: wiki
category: Algorithms
tags: [数论,离散数学]
---

## 组合（规模为n，每项可取m种值，则有m^n种情形）——进制遍历法



~~~C
int n = 3;
int a[3];
for(int i=1;i<=n;i++){
	a[i-1]=0;
}
a[0]=-1;
int jinwei=0;
int weishu;
for(weishu=1;weishu<=n;){
	a[0]++;
	jinwei = 0;
	for(int j=1;j<=weishu;j++){
		a[j-1]+=jinwei;
		if(a[j-1]==n){
			jinwei=1;
			if(j==weishu)
				weishu++;
			a[j-1] = 0;
		}
		else{
			break;
		}
	}
	...              //当前进制选择情况下进行的计算
}
~~~
