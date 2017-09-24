---
title: gc
layout: wiki
category: php
tags: [内存释放,引用计数]
---

* 写时复制
* 引用计数

## zval

下面是7.1.9版本的zval定义，从结构上看，已经相当复杂了，相比于老版本的php，

~~~c
struct _zval_struct {
	zend_value        value;			/* value */
	union {
		struct {
			ZEND_ENDIAN_LOHI_4(
				zend_uchar    type,			/* active type */
				zend_uchar    type_flags,
				zend_uchar    const_flags,
				zend_uchar    reserved)	    /* call info for EX(This) */
		} v;
		uint32_t type_info;
	} u1;
	union {
		uint32_t     next;                 /* hash collision chain */
		uint32_t     cache_slot;           /* literal cache slot */
		uint32_t     lineno;               /* line number (for ast nodes) */
		uint32_t     num_args;             /* arguments number for EX(This) */
		uint32_t     fe_pos;               /* foreach position */
		uint32_t     fe_iter_idx;          /* foreach iterator index */
		uint32_t     access_flags;         /* class constant access flags */
		uint32_t     property_guard;       /* single property guard */
		uint32_t     extra;                /* not further specified */
	} u2;
};
~~~


## HashTable

php的基础数据结构，数组是用它实现的，还有全局变量符号表等也是用它实现的

## _zend_executor_globals

全局符号表

## _zend_execute_data

当前指向的符号表