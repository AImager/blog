---
title: grant
layout: wiki
category: mysql
tags: [权限,用户,密码]
---

## 权限控制

```shell
# 显示当前用户对各数据库的权限
show grants;

# 显示完整用户
SELECT DISTINCT CONCAT('User: ''',user,'''@''',host,''';') AS query FROM mysql.user;

# 创建用户
create user 'yucong'@'%' identified by 'password';

# 5.7以前修改用户密码
UPDATE user SET password=PASSWORD('password') WHERE user='user_name';

# 5.7修改用户密码
alter user 'root'@'localhost' identified by 'root';

# 授权全部权限
GRANT ALL ON *.* TO 'username'@'%';

# 刷新权限
FLUSH PRIVILEGES;
```

## 参考链接

* [SET PASSWORD Syntax](https://dev.mysql.com/doc/refman/5.7/en/set-password.html)
* [Assigning Account Passwords](https://dev.mysql.com/doc/refman/5.7/en/assigning-passwords.html)