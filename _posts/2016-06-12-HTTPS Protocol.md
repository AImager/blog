---
title: HTTPS协议
layout: post
tag: [HTTPS]
---

## 非对称加密

非对称加密中，加密和解密的密匙成对存在，两个密匙本质上不区分，均可用于加密和解密，公匙和私匙的叫法取决于场景，公匙常被公开出去，用于沟通方加密后传输信息，私匙保密，用来解开沟通发发送的加密信息。

### RSA

RSA是经典的非对称加密算法，具体理论如下：

1. p与q为两个不相同的素数
2. \\( n=p*q \\)，其中n的二进制位数即常说的RSA加密位数，1024安全，2048很安全
3. \\( \phi(n) = \phi(pq) = \phi(p)\phi(q) = (p-1)(q-1)  \\)，\\( \phi(n) \\)表示欧拉函数，即小于n且与n互质的数的个数，其中第二个等号只有在p与q互质的时候成立
4. 生成一个整数e，满足\\( 1 < e < \phi(n) \\)，\\( gcd(\phi(n), e) = 1 \\)，至此，用来加密信息的公匙n和e已经生成
5. 取满足公式\\( e*d = 1 (mod \phi(n)) \\)的值d，至此，用来解密信息的私匙n和d已经生成

加密信息m，c为加密后的信息

$$ m^e \equiv c (mod n) $$

解密信息

$$ c^d \equiv m (mod n) $$


## 对称加密

对称加密中，加密和解密的密匙是完全一样的。

### AES

AES是经典的对称加密算法，核心在四个步骤，但还有一些问题没有解决，先放这了。

1. sbox怎么得到的？
2. mixcolumns里的常数数组怎么得到的？
3. key schedule里面的rcon怎么得到的？

## HASH

HASH就是通过一系列步骤将源数据转换成格式化后的数据，常见的HASH算法比如取模、MD5等，因为不具备可逆性，所以主要用于验证数据是否被更改。

## HTTPS协议流程

![](/media/img/2016/https pkg.png)

1. 『包5348-5390』，TCP三次握手『后面应答ack和请求seq的相关内容就不赘述了』

2. 『包5391』客户端问候，发送的内容包括内容类型、TLS版本号、随机数、Session ID Length、算法簇、压缩方法以及各种扩展等，这里抽以下几点来说
  * Session ID Length用来表示session长度，如果还保有连接的session，那么就无需走完整个流程
  * 算法簇包含所有支持的加密算法
  * 扩展有很多，比如签名算法，其中有个server_name用来记录域名，解决原先SSL要求IP地址的问题

3. 『包5440』，服务器问候，发送的内容包括内容类型、TLS版本号、随机数、确认使用的加密算法、扩展等

4. 『包5441』，服务器发送证书

5. 客户端验证证书。看下图，有三层证书，每层证书都有一个发行者，最下层的发行者就是我们当前访问的这个网站。每层证书都是由上一层证书的发行者所认证的，即我们当前访问网站的证书就是由GlobalSign Domain Validation CA的发行者认证的，通过这样的认证逻辑我们就得到了一个证书链，而证书链的最上层被称为根证书，一般被集成在如浏览器的客户端里，根证书也是被直接信任的，所以当我们通过证书链去向上验证证书的可靠性的时候，总是会无条件的相信某个根证书。因为证书链每一段的认证逻辑是一样的，所以我们只需要知道某一段的验证逻辑即可。以当前网站证书的验证做例子，我们要验证它是可靠的，实际上就是要验证它确实是上层机构颁发的，证书是抽象概念，里面的核心在于签名，只要验证签名是上层机构生成的即可，怎么做呢？这里就要引入非对称加密了，数字证书里面除了包含签名，还包括发行者生成的一份公匙，当然，对应的会有一份私匙，不过这份私匙是发行者的核心机密，不会公开。所以如果我用上层机构的私匙去生成我证书的签名，然后只要用上层机构的公匙能解开数据，那就证明我的签名是上层机构生成的，也就证明我的证书是有效的。事实上，证书的验证思路就是这样。但有另外一个问题——怎么说明公匙正确的解开了数据呢？要知道，比如RSA的非对称加密就是个幂模的过程，如果加密的信息是自然语言，那解出来我们读的懂就算解密成功了，但加密的本身是无意义的信息，我用另外的密匙解出来也是一堆读不懂的东西，也没法说是错的啊！标准制定者们自然意识到这个问题，所以对加密的信息做了约束，制定了PKCS#1标准『另一个组织发布的X.509标准也包含这部分』，只有解密出来的结果满足这个标准才叫解密成功。

6. 『包5443』，验证成功后交换密匙，这里的交换并非真正意义上的交换，而是发送一个被证书公匙加密的随机数，这样加上步骤2和步骤3的随机数共有3个随机数，然后基于这3个随机数通过步骤3中协定的算法生成最终的通信密匙，而这个密匙就是后期对称加密的通信密匙。至此，客户端的HTTPS握手流程结束。

7. 『包5469』，服务端计算出和客户端一样的密匙。至此，服务端的HTTPS握手流程结束。

8. 『包5510-5557』，对称加密通信

![](/media/img/2016/certificate.png)


## HTTPS解决了什么问题

『冒充』，冒充如果没有拿到对称密匙，发送的数据实际上也没有太多意义。

『信息篡改、丢失』，加密信息改变后其实解密后的数据已经有问题，但是即使没问题，解密后的HASH校验也可以用于验证数据的准确性。

『窃听』，数据被加密了，所以即使被窃听，也没有用。

当然HTTPS也不是万无一失，如果再HTTPS握手完成前就被冒充了，那实际上后面的所有过程都将完全暴露，不过这个锅也没法让HTTPS背了。