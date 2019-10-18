---
layout: wiki
tags: [外观,结构型,模式]
---


外观模式就是对外隐藏复杂的内部构造，方便外部调用者的使用，所以核心在于方便分工上面。

## php实现

```java
/* Memory.java */
public class Memory {
    public void run() {
        System.out.println("memory is runing");
    }

    public void shutdown() {
        System.out.println("memory is shutdown");
    }
}


/* CPU.java */
public class CPU {
    public void run() {
        System.out.println("cpu is runing");
    }

    public void shutdown() {
        System.out.println("cpu is shutdown");
    }
}


/* Computer.java */
public class Computer {
    private CPU cpu;
    private Memory memory;

    public Computer() {
        this.cpu = new CPU();
        this.memory = new Memory();
    }
    public void start() {
        this.cpu.run();
        this.memory.run();
    }

    public void shutdown() {
        this.cpu.shutdown();
        this.memory.shutdown();
    }
}

/* FacadeTest.java */
public class FacadeTest {
    public static void main(String[] args) {
        Computer computer = new Computer();
        computer.start();
    }
}
```
