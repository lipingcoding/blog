---
title: 读 How to make mistakes in python
date: 2019-03-30 13:38:46
categories: python
tags: [python, coding, reading, 读书]

---

Reading notes for the book *How to make mistakes in python*.

<!--more-->

### 不要污染系统的 python 

工具, virtualenv, pyvenv, 后者是 python3.3 之后自带的. 更复杂的有 conda, 一般不需要. 

### Silly mistakes

1. 定义函数时忘记 return, python 默认返回 None. 这时候如果利用函数返回值进行判断就会有 bug

2. Misspellings

   用自动补全插件

   用 pylint 之类插件

   多测试, 早测试 

3.  class 与 def 弄混







<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

