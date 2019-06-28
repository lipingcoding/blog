---
title: python文件读写
date: 2019-03-21 19:38:31
categories: python
tags: python

---

本文介绍 python 中文本文件, 图像, xml 的读写, 方法很多, 只介绍最有用的

<!--more-->

为了读写文件, 首先得打开一个文件对象, 读写都是对文件对象操作, 而不是直接对文件

# 文件对象

```python 
with open('a.txt', 'w') as f:
#这样跳出循环体后, 自动 close 文件对象 
#模式符除 'w' 外, 还有 'r', 'a'...
```



# 文本文件读取

```python
fin.readline() #读取一行, 包括行末的'\n'
while True:
    line = fin.readline()
    if line is None:
        break
        
        
fin.readlines() #读取所有行, 返回 list


for line in fin: #这种方法最好, 省去判断文件结束
    
    
```



# 文本文件写入:

```python 
#和读类似, 但是没有 writeline 与 readline 对应
fin.write('a line\n') #需要自己写 '\n'
fin.writelines(['first line\n', 'second line\n'])
```









# 图像读取

```python
import matplotlib.image as mpimg
mpimg.imread() #类似 matlab
```



<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

