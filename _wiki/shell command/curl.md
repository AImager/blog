---
title: curl
layout: wiki
category: shell command
tags: [网络,传输,流]
---

## 实例

~~~Text
# 以get的方式获取网络流
curl --request GET baidu.com

# 以form-data的参数形式post数据获取网络流
curl -d "uid=144421&stid=171073&oil_id=5" 10.211.55.3:8101/Recommendation/retailRecommend
~~~
