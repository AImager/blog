---
title: PHP-FPM到底支不支持长连接
layout: post
tag: [php,长连接]
---

其实有这个疑问已经很久了，但之前看一些讲PHP-FPM原理的博客，几乎都会给出一个核心结论——一个request完成后，FPM的worker会释放request相关的所有内存资源，正是基于这个结论（二手资料毁人啊~），导致我很长一段时间都认为PHP-FPM不支持worker级别的长连接，只支持单个request内的连接复用。显然，这是个错误的结论，因此标题的提问答案是肯定的，至于为什么，下面详述。

现成的phpredis、pdo、mysqli在文档中都写明支持长连接，但为了更准确，我们从定义层面去验证下。以phpredis为例子（它是以pconnect来实现长连接的），一个请求调用了pconnect，后续没有请求再进来，但对应worker进程上依旧存在ESTABLISHED状态的redis连接，通过strace跟踪请求，发现pconnect创建的套接字并没有执行CLOSE。而且后续的请求，均不存在socket函数的调用，也就是套接字对应的连接确实被复用了，也确实完成了一个worker级别的长连接。

但是，为什么？不是说『FPM的worker会释放request相关的所有内存资源』，那后续的请求是如何拿到连接的对象的呢？

要找答案，读源码还是最靠谱的方式。先来看看phpredis的pconnect实现

```c
PHP_METHOD(Redis, connect)
{
    if (redis_connect(INTERNAL_FUNCTION_PARAM_PASSTHRU, 0) == FAILURE) {
        RETURN_FALSE;
    } else {
        RETURN_TRUE;
    }
}

PHP_METHOD(Redis, pconnect)
{
    if (redis_connect(INTERNAL_FUNCTION_PARAM_PASSTHRU, 1) == FAILURE) {
        RETURN_FALSE;
    } else {
        RETURN_TRUE;
    }
}

PHP_REDIS_API int
redis_connect(INTERNAL_FUNCTION_PARAMETERS, int persistent)
```

我把connect和pconnect最外面的实现都贴出来了，几乎没有区别，只在调用`redis_connect`时有`persistent`参数的区别，而这个参数在字面上也很容易理解，即持久连接的标识符，所以跟踪`redis_connect`有关`persistent`的关键代码即可。`redis_connect`中的重要部分即`redis_sock_create`的创建sock以及`redis_sock_server_open`的建立连接，继续追踪代码，最后在`redis_sock_server_open`的下层调用`redis_sock_connect`中找到了持久连接的核心代码

```c
if (redis_sock->persistent) {
    if (redis_sock->persistent_id) {
        spprintf(&persistent_id, 0, "phpredis:%s:%s", host,
            ZSTR_VAL(redis_sock->persistent_id));
    } else {
        spprintf(&persistent_id, 0, "phpredis:%s:%f", host,
            redis_sock->timeout);
    }
}

redis_sock->stream = php_stream_xport_create(host, host_len,
    0, STREAM_XPORT_CLIENT | STREAM_XPORT_CONNECT,
    persistent_id, tv_ptr, NULL, NULL, &err);
```

代码逻辑不复杂，即在通常未指定`persistent_id`的情况下，会建立以host和timeout为种子的`persistent_id`，然后通过zend提供的API函数`php_stream_xport_create`来建立连接。而`php_stream_xport_create`则通过`persistent_id`是否有值来决定是否建立长连接，并写入每个进程独立维护的`persistent_list`（参考php的`php_stream_xport_create`源码部分）。

到了这里，基本上明确了，FPM并不会完全清掉数据，因为它本身也会维护一些zend底层的结构，比如这里的`persistent_list`。而请求则是以内嵌的形式运行在FPM的worker容器中（可以联想下常用的框架和DI），并不时会与worker容器有数据交互，比如写入socket描述符到`persistent_list`里面，这样下次请求再来的时候，就可以到`persistent_list`取回数据继续用，其中类似`persistent_id`的结构就是用于取回socket的标识id。


## 参考链接

* [zend_parse_parameters](http://www.voidcn.com/article/p-yskdkrbk-bhq.html)
* [phpredis](https://github.com/phpredis/phpredis)
