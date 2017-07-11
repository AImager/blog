## 第1章 简介

### 1.1



### 1.2

直接实践就行，意在说明服务器之间的网络延迟和时钟差异，实践中可能遇到的问题

* 编译，这个源码的README写的很清楚，对应不同系统的报错Google即可
* cli本机的时候，13端口对应的daytime服务未开启，可以开启daytimetcpsrv，也可以Google开启系统服务，MAC我还没找到方法。当然，也可以使用外网服务地址，比如64.113.32.5

### 1.3


### 1.4

`count++;`，输出1。

### 1.5

改造简单，结果自然是没法输出count值，因为一直有数据过来。

## 第2章 传输层: TCP、UDP和SCTP

### 2.1

锻炼查找一手资料的能力，二手资料一般baidu、google都很容易找到。本题答案在<https://www.iana.org/assignments/version-numbers/version-numbers.xhtml#version-numbers-1>。

### 2.2

在rfc-editor上搜索IPv5的RFC，IPv5的全名为Internet Stream Protocol，所以关键字很重要

### 2.3

因为536=最小重组缓冲区值576-IPv4头20-TCP头20，而最小重组缓冲区是标准对实现的约定，这样可以保证即使不约定MSS通信也可以正常进行

### 2.4

使用wireshark抓包

### 2.5

协商以小的那个为准

### 2.6

通过Cisco 

### 2.7



 