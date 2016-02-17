---
title: SQL必知必会
---

order by 2中的2表示select选择的第二个

AND和OR混合使用的时候，优先处理AND，如
EXP1 AND EXP2 OR EXP3 AND EXP4
先处理同时满足EXP1和EXP2以及同时满足EXP3和EXP4的数据，然后将两个数据或处理
不过最好不要这么做，还是加括号








select
from
where
order by
and
or

!=和<>都表示不等于，基本大部分两个都支持，但比如access只支持<>

in：找出所有在筛选方案中的数据，select * from test where cong in ('a','b')，筛选出test表中所有cong字段为a或b的数据行
not：进行否定
like：通配符进行匹配
%：任意字符出现任意多次，select * from test where cong like 'fish%'，筛选出test表中所有cong字段以fish开头的数据行
_：匹配任意一个字符
[]：指定一个字符集


+和||都表示拼接字段，mysql不支持采用CONCAT进行拼接，select concat('(',cong,')') from test，从test表中筛选出cong字段和'('')'组成新字段


在thinkphp中M方法执行的sql得到的结果均为二维数组，一维索引是数字位置，二维索引对应select后面的内容



as：标记别名

数据库中可以直接进行数值计算


字符处理函数：
UPPER():将文本转换为大写
LOWER()：将串转换为小写
LEFT()：返回串左边的字符
RIGHT()：返回串右边的字符
LENGTH()：返回串的长度
SOUNDEX()：返回串的SOUNDEX值
RTRIM()清空数据右边的所有空格
LTRIM()清空数据左边的所有空格

日期和时间处理函数：
DATE_PART()：返回日期的某个部分，MySQL使用YEAR()提取年份


数值处理函数：
ABS()：绝对值
COS()：余弦函数
EXP()：指数值
PI()：圆周率
SIN()：正弦函数
SQRT()：平方根
TAN()：正切函数

聚集函数：
AVG()：平均值
COUNT()：行数和
MAX()：最大值
MIN()：最小值
SUM()：列和


distinct：包含不同的值



group by：创建分组，select vend_id, count(*) as num_prods from products group by vend_id，先将product表按vend_id进行分组，让后每个分组筛选出vend_id值和个数，






顺序

select, from, where, group by, having, order by


having过滤分组，where过滤行，任意能用where写的SQL都能用having进行代替



()可以包括查询子句


inner join
left join
right join

select * from A
left join B
on A.aID = B.bID


select * from A
right join B
on A.aID = B.bID


select * from A
innerjoin B
on A.aID = B.bID



as(oracle中没有as)




外部联结
*=(oracle使用) 等同于 right outer join
=*（oracle使用） 等同于 left outer join


union：连接多条select语句


insert into test values ('a','b');
插入完整的行

insert into test (column1, column2) values ('a','b');
当(column1,column2)省略的时候，默认插入行，但即使插入行，最好还是把中间的加上，方便移植




insert into test1 () select * from test;
从test表中筛选数据插入到test1表中去

select into


update test set column='' where stid=''
更新表test的column列的stid=''的数据为...



delete from test where
删除行


alter table test add/drop phone;
为test表添加/删除phone字段


drop table test;
删除表


create view test as
select ...
创建一个视图取名为test


limit


事务、游标、存储过程
索引、约束、触发器
