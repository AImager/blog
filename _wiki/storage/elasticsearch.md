---
layout: wiki
tags: [搜索,lucene]
---

## 查看索引情况

get _cat/indices?v

## 搜索

get {{index}}/{{type}}/_search

## 分词分析

get {{index}}/_analyze

## 删除数据

post {{index}}/{{type}}/_delete_by_query

## 查看type的mapping

get {{index}}/{{type}}/_mapping

