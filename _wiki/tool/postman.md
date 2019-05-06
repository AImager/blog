---
layout: wiki
tags: [api]
---

## 权限校验

如果是用的非定制化的权限方案，比如OAuth2.0或者Basic Auth，那么直接在request界面的Authorization栏目下选择对应的权限校验选项即可。但如果采用的是自研的方案，比如接口需要指定参数获取token，或者token以cookie的形式存在，那么这时候就需要自己配置auth-request。

## Pre-request

Pre-request是在request执行的脚本，比如下面的代码就是实时获取当前的时间戳，并设置成一个环境变量，这样在Body或者params下面就可以直接使用`{{ctimestamp}}`做参数，避免了每次都养手动输入当前时间。

```javascript
var date = new Date();
var time = date.getTime();
pm.environment.set("ctimestamp", time);
```

## Test

Test是执行完request后进行测试的脚本，但除了测试，还可以进行一些特殊操作，比如以下代码，就是获取返回结果的`data.ssoCode`值，并将其设置为全局变量ssoCode的值。

```javascript
pm.test("response is ok", function () {
    pm.globals.set("ssoCode", pm.response.json().data.ssoCode);
});
```