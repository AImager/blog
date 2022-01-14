---
layout: wiki
tags: [网络,传输,流]
---

## 实例

```shell
# 以get的方式获取网络流
curl --request GET baidu.com

# 以form-data的参数形式post数据获取网络流
curl -d "uid=144421&stid=171073&oil_id=5" 10.211.55.3:8101/Recommendation/retailRecommend

# 显示详细的http报文信息
curl -kv baidu.com

# 指定rootca.pem作为根证书，访问时校验服务端证书的合法性
curl --cacert rootca.pem https://test/test
```

## command

### --cacert

指定根证书，用于校验服务端证书的合法性

### -k/--insecure

不校验服务端证书的合法性

## 参考链接

* [shell中的curl网络请求](https://www.jianshu.com/p/45c8605ec217)
