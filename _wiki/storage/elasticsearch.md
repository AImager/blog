---
layout: wiki
tags: [搜索,lucene]
---

## 命令

### 查看索引情况

get _cat/indices?v

### 搜索

get {{index}}/{{type}}/_search

### 分词分析

get {{index}}/_analyze

### 删除数据

post {{index}}/{{type}}/_delete_by_query

### 查看type的mapping

get {{index}}/{{type}}/_mapping

## 实例

```json
// 查询所有文档
{
	"from": 0,
	"size": 10,
	"query": {
		"bool": {
			"should": {
				"match_all": {}
			}
		}
	},
}
```

```json
// 查询最佳匹配
{
	"from": 0,
	"size": 10,
	"query": {
		"multi_match": {
			"query": "喵喵奶茶店",
			"type": "best_fields",
			"fields": [
				"app_name"
			],
			"tie_breaker": 0.3
		}
	},
	"highlight": {
		"fields": {
			"app_name": {}
		}
	}
}
```

