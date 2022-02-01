---
layout: wiki
tags: [适配器,结构型,模式]
---

适配器，顾名思义就是做接口转换的，在软件设计里，常用到适配器的一个场景就是调用者和被调用者都已经固定好了接口，但两者是独立开发的，并不一致，为了在不改动两者的情况下进行调用整合，就需要在两者之间加一个适配器。比如自研的支付网关对接各种支付的SDK，框架对接各种DBLib。

## java实现

```java
/* Mysql.java */
public class Mysql {
    public void connectMysql() {
        System.out.println("mysql");
    }
}

/* Postgresql.java */
public class Postgresql implements DBAdapter {
    public void connect() {
        System.out.println("postgresql");
    }
}


/* MysqlAdapter.java */
public class MysqlAdapter implements DBAdapter {
    private Mysql mysql;

    public MysqlAdapter() {
        this.mysql = new Mysql();
    }

    public void connect() {
        this.mysql.connectMysql();
    }
}


/* PostgersqlAdapter.java */
public class PostgersqlAdapter implements DBAdapter {
    private Postgresql postgresql;

    public PostgersqlAdapter() {
        this.postgresql = new Postgresql();
    }

    public void connect() {
        this.postgresql.connect();
    }
}


/* DBAdapter.java */
public interface DBAdapter {
    public void connect();
}

/* AdapterTest.java */
public class AdapterTest {
    public static void main(String[] args) {
        DBAdapter inter = new Postgresql();
        inter.connect();

        // after add adapter code
        DBAdapter inter = new MysqlAdapter();
        // DBAdapter inter = new PostgresqlAdapter();
        inter.connect();
    }
}
```

php的写法和java基本相同，所以这里就不展示了。

简要说下代码的场景，最初系统中有AdapterTest、DBAdapter、Postgresql三个文件，此时突然引入Mysql文件——引入多个数据库，但Mysql的连接命令是connectMysql，那么直观的想法就是改造Mysql，但秉承对修改关闭的原则，此时适配器就派上用场了，通过MysqlAdapter来适配connect，从而优美的完成了我们的目标。PostgersqlAdapter是后来加上去的，和mysql保持一致。

注意看代码，postgresql是没有用适配器的，而且很多情况下，我们甚至不会用interface的，因为很多时候系统设计并不会考虑接入多个数据库，这个时候多态、适配器什么的没任何意义。但问题就在于，我无法预支未来，所以对于这种权衡问题，只能说看场景————废话。


