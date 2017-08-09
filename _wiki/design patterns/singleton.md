---
title: singleton
layout: wiki
category: design patterns
tags: [单例,创建型,模式]
---


单个进程/线程中避免生成多个实例


## php单例的实现

~~~PHP
class Singleton {
	private static $_instance = null;
	
	// defend new instance external
	protected function __construct() {

	}
	
	public static function getInstance () {
		if(self::$_instance === null) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}
}
~~~
