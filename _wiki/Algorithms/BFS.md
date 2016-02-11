~~~C
#include <stdio.h>
#include <stdlib.h>
#define MAX ~        //定义可以寻找的最大次数

// 以下typeBFS代表每个结点的数据结构
// 这里假设每个结点数据结构不是单一的基础数据（int、char等），而是复合数据（struct、数组等）
// 在选好对应的数据结构描述模拟结点时，最好加上一个标识符——当前结点在树中的层数
// 有需要加特殊标识符另算，如移拼图中每个结点需要加上标识符——0在数组中的位置

int Bianhuan(typeBFS* nowChuliJiegou, int chulifangshi){    //nowChuliJiegou即当前处理结构，chulifangshi即对N叉树BFS的编号
	int bianhuanYN=1;     //变换是否成功的标志，默认成功
	switch(chulifangshi){
		case 1:
			if(第一条叉是不可变){
				bianhuanYN=0;
				break;
			}
			else{
				…     //第一条叉变化具体方式
				break;
			}
		case 2:
			…       //具体同case 1
		…
		case n:
			…       //具体同case 1
	}
	return bianhuanYN;
}

int Pipei(typeBFS* nowState, typeBFS* indexState){      //匹配当前状态nowState和目标状态indexState
	int pipeiYN=1;     //匹配是否成功的标志，默认成功
	…     //具体匹配具体选择
	return pipeiYN;
}

int main(){
	int i;    //变换脚标
	typeBFS* indexState=~;       //定义目标状态（也可当作是个结点）的指针
	typeBFS** jiedianBiao=(typeBFS**)malloc(MAX*sizeof(typeBFS*));    //定义结点指针数组表
	int daodaMaxYN=0,bianhuanYN, pipeiYN, nowChuliBianhao=0, int nowMotherBianhao=0;   //是否达到最大遍历量，变换成功标志位，匹配成功标志位，现在处理的结点在结点表中的编号，现在处理的结点的父节点编号
	scanf <---- jiedianBiao[0]     //输入初始状态
	while(1){
		for(i=1;i<=n;i++){         //n叉树
			if(nowChuliBianhao<MAX){
				nowChuliBianhao++;
				if(jiedianBiao[nowChuliBianhao]==NULL)
					jiedianBiao[nowChuliBianhao]=(typeBFS*)malloc(sizeof(typeBFS));     //当前处理结点未分配内存就先分配
				jiedianBiao[nowChuliBianhao]=jiedianBiao[nowMotherBianhao];     //先把当前处理结点初始化和其父节点相同
				bianhuanYN=Bianhuan(jiedianBiao[nowChuliBianhao], i);         //将当前处理结点带入函数进行i号变换
				if(bianhuanYN==0){   //变换不成功
					nowChuliBianhao--;     //变换不成功就不加入后续队列
				}
				else{
					pipeiYN=Pipei(jiedianBiao[nowChuliBianhao], indexState);
					if(pipeiYN==1){
						…    //匹配成功就进行需要的处理
					}
				}
			}
			else{
				daodaMaxYN=1;
				break;
			}
		}
		if(daodaMaxYN==1){
			break;
		}
		nowMotherBianhao++;
	}
	if(daodaMaxYN==1){
		…         //没有匹配的处理
	}
	return 0;
}
~~~
