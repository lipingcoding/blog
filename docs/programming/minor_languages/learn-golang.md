---
title: 读 < The go programming language > 
date: 2018-11-20 20:46:16
categories: go
tags: [go, golang]

---

# Chapter 1 Introduction

Some simple examples to get you familiar with go.

<!--more--> 

# Chapter 2 Programs structures

### 2.1 Names

与其它语言一样, 支持字母、数字、下划线, 但不能数字开头. 但是这里是针对 utf-8 来说的. 但最好还是用英文. 



### 2.2 声明

- 分为 var, const, type, func. 分别是变量、常量、自定义类型、自定义函数



### 2.3 变量

#####  2.3.1声明

四种声明方式

1. var *name* *type* = *expression*
2. var *name* *type* 
3. var  *type* = *expression*
4. *name* := *expression*

第 4 种只能用于 function 内部. 第 2 种用默认初始化, 一般为 zero-value. 第 3 种自动推断类型. 

##### 2.3.2

Pointer 类型和 C 的几乎一样

##### 2.3.3 new 

new(*type*) 生成一个无名的 type 类型, 并返回**指针** . 

##### 2.3.4 生存期

Package-level var: 不在函数体内声明, 在整个package 内可见, 生存期为 the entire execution of the program 

local var: 在函数体内声明, 生存期从被声明开始, until it becomes unreachable, 这涉及到go的回收机制, 比较复杂. 



### 2.4 赋值

支持 tuple-assignment, 例如 ` x,y = y, x` 



###  2.5别名

类似 c++ 

### 2.6 packages and files 

go file 以.go 为后辍, 结构如下

```
package main // other name is ok to create own package 
import (
	"fmt"
	"os"
)


```



go 的一个特点是不仅告诉你可以做什么, 还告诉你不可以做什么. 如果你引入了一个 package , 但从来没用, 会报错. 

##### package initalization 

- 优先根据依赖关系, 然后结合声明的顺序, 依次初始化. 
- 一个 .go file 里可以有若干个 init( ) 函数, 不可显式调用, 会根据声明顺序, 依次自动调用.

# Chapter 3 basic types 

类似 C++, 需要再查阅





# Chapter 4 Composite Types 





### 4.1 Array  

类似 C++

### 4.2 切片

类似 python 

### 4.3 Map

map is actually a reference to hash-table 

声明方式

-  *map_name*  : = make(map[ *key_type*] *value_type*)
-  *map_name*  : = map[ *key_type*] *value_type* { }

# Remarks

- a++ 不返回值, 不能用来给别的变量赋值.
- Package-level的变量、type、function等如果首字母大写, 说明被 export 了, scope 从该package 内所有 file 变成其它package 也可见

<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

