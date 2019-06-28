## 第三章: ipython 的使用



1. object introspection

功能: 打印对象的相关信息

用法:

​	对象+?

​	对象+??, 如果可能, 还会输出源码

? 还可以结合通配符 * 用于检索

1. %run

   如果在普通的python命令行中, 要想执行某个python脚本, 必须先退出python环境, 然后再执行. 在ipython中不必这样. %run 后接要执行的脚本即可.

   但是需要注意命名空间的问题: 要执行的脚本能否访问interactive(就是ipython执行的那个空间)中的变量, 还有脚本执行后, 脚本中的变量能否在ipython中访问. 

   这个问题可以在ipython中输入 %run? 查看 %run命令的帮助文档.

2. %paste  or %cpaste

   由于在命令行中粘贴相当于一行一行执行, 一旦遇到空行, python解释器就认为缩进结束, 然后就报错 Indentation error . 

   %paste 和 %cpaste 两个命令可以直接执行clipboard中的代码

   区别在于 %cpaste, 粘贴后不直接运行, 你试试就知道了

   像这样以%开关的命令叫magic命令, 输入 %magic, 可以查看到所有的magic命令.

3. 类似bash的快捷键(基于mac)

   Ctrl + P : 向前搜索命令历史中以当前输入文本开头的命令

   Ctrl + N:  向后搜索命令历史中以当前输入文本开头的命令

   Ctrl + A: 将光标移到行首

   Ctrl + E: 将光标移到行尾

   Ctrl + U: 删除从光标到行尾

   Ctrl + K: 删除从光标到行首

   Ctrl + L 或者 Cmd + K: 清屏

## 第四章: Numpy使用

1. ndarray

   是numpy最主要的操作对象.

   属性:

   ​	.shape

   ​	.type

   生成:

   ​	array

   ​		

   ```python
   In [2]: np.array([[2,3],[4,5]])
   Out[2]: 
   array([[2, 3],
          [4, 5]])
   
   In [8]: a = [[2,3],[4,5]]
   
   In [9]: m = np.array(a)
   
   In [10]: a
   Out[10]: [[2, 3], [4, 5]]
   
   In [11]: m
   Out[11]: 
   array([[2, 3],
          [4, 5]])
   ```

   ​	注意到ndarray 在内部显示以及函数中却是 array	

   ​	传入一个参数后, array 函数是复制参数list, 而不是将list转化成array.

   ​	asarray

   ```python
   In [12]: a
   Out[12]: [[2, 3], [4, 5]]
   
   In [13]: m = np.asarray(a)
   
   In [14]: a
   Out[14]: [[2, 3], [4, 5]]
   
   In [15]: m
   Out[15]: 
   array([[2, 3],
          [4, 5]])
   ```

   ​	前缀 as 给人感觉是直接转化, 但还是复制.

   ​	arange: 类似python中的range, 但是返回 array

   ​	ones, oneslike

   ```python
   In [20]: t = np.ones((2,3))
   
   In [21]: s = np.ones_like(t)
   
   In [22]: t
   Out[22]: 
   array([[1., 1., 1.],
          [1., 1., 1.]])
   
   In [23]: s
   Out[23]: 
   array([[1., 1., 1.],
          [1., 1., 1.]])
   
   In [24]: np.ones(t.shape)
   Out[24]: 
   array([[1., 1., 1.],
          [1., 1., 1.]])
   
   ```

   ​	下面三组函数完全类似

   ​	zeros, zeroslike

   ​	empty, emptylike

   ​	eye, identity



1. 索引和切片

   索引是指通过指定下标, 获取元素值.

   切片是指通过指定一个连续的下标范围, 获取元素值.

   注意不管是索引还是切片, 获得的都是引用, 因为numpy 是为大数据设计的, 如果都复制, 会造成巨大的开销. 

   当然, 你也可以显式地获得一个copy的副本, 这就涉及到深拷贝与浅拷贝的问题, 以后再研究下.

   多维数组下标索引时, 可以用索引列表

   ```python 
   In [35]: m
   Out[35]: 
   array([[2, 3],
          [4, 5]])
   
   In [36]: m[1,1] # 相当于 m[1][1], 这很重要
   Out[36]: 5
   
   In [37]: m[1][1]
   Out[37]: 5
   ```



   这在array维度较高时, 写起来较方便. 

   索引列表也可以用在切片中

```python 
   In [41]: m
   Out[41]: 
   array([[1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]])
   
   In [42]: m[1:, :2]
   Out[42]: 
   array([[4, 5],
          [7, 8]])
```





3.布尔型索引

```python 
In [14]: index
Out[14]: array([0, 1, 2, 3, 4])

In [15]: data
Out[15]: 
array([[ 0,  1,  2,  3,  4],
       [ 5,  6,  7,  8,  9],
       [10, 11, 12, 13, 14],
       [15, 16, 17, 18, 19],
       [20, 21, 22, 23, 24]])

In [30]: index > 2
Out[30]: array([False, False, False,  True,  True])
    
In [31]: data[index > 2]
Out[31]: 
array([[15, 16, 17, 18, 19],
       [20, 21, 22, 23, 24]])

```

多个逻辑条件怎么办呢?

```python 
In [32]: data[index > 2 and index <4]
---------------------------------------------------------------------------
ValueError                                Traceback (most recent call last)
<ipython-input-32-81cece05842b> in <module>()
----> 1 data[index > 2 and index <4]

ValueError: The truth value of an array with more than one element is ambiguous. Use a.any() or a.all()


```

根据报错信息, python 是不支持 piece-wise 的逻辑运算的, 但是可以利用 & , | 达到类似目的, 注意: & , | 其实是位运算. 这不正是将数组元素看成了数组的位了吗! 非常合理!

```python 
In [33]: data[(index > 2) & (index <4)]
Out[33]: array([[15, 16, 17, 18, 19]])

    
# 位运算
In [34]: 5 & 6
Out[34]: 4

```



1. 利用整数数组索引

   看个例子就明白了.

   ```python 
   In [35]: data = np.arange(32).reshape(8,4)
   
   In [36]: data
   Out[36]: 
   array([[ 0,  1,  2,  3],
          [ 4,  5,  6,  7],
          [ 8,  9, 10, 11],
          [12, 13, 14, 15],
          [16, 17, 18, 19],
          [20, 21, 22, 23],
          [24, 25, 26, 27],
          [28, 29, 30, 31]])
   
   In [37]: data[ [3, 1, 0, 5] ] #传入的是一个整数数组
   Out[37]: 
   array([[12, 13, 14, 15],
          [ 4,  5,  6,  7],
          [ 0,  1,  2,  3],
          [20, 21, 22, 23]])
   
   ```

再看

```python 
In [43]: data
Out[43]: 
array([[ 0,  1,  2,  3],
       [ 4,  5,  6,  7],
       [ 8,  9, 10, 11],
       [12, 13, 14, 15],
       [16, 17, 18, 19],
       [20, 21, 22, 23],
       [24, 25, 26, 27],
       [28, 29, 30, 31]])

In [44]: data[[3,1,0,5],[0,1,2,3]] 
Out[44]: array([12,  5,  2, 23])
```

我刚开始以为 `data[[3,1,0,5],[0,1,2,3]] = data[[3,1,0,5]][[0,1,2,3]]`,

但是不能这么理解

```python 
In [52]: data[[3,1,0,5]][[0,1,2,3]]
Out[52]: 
array([[12, 13, 14, 15],
       [ 4,  5,  6,  7],
       [ 0,  1,  2,  3],
       [20, 21, 22, 23]])
```

因为 `[ , ]` 中, 逗号隔开的是不同的 axes, 但是 `[ ][ ]`中, 两个中括号的运算是先后关系. 

注意, 利用整数数组索引, 会拷贝,  而不是引用.



1. np.where

   通过两个例子即可掌握其用法

   ```python 
   In [65]: x = np.array([2,3, -1])
   
   In [66]: y = np.array([0,2,-3])
   
   In [67]: np.where(x>y, x, y)
   Out[67]: array([ 2,  3, -1])
       
   In [68]: np.where(x>0, 1, -1)
   Out[68]: array([ 1,  1, -1])
   ```

6.np 中还有随机数, 线性代数, 集合运算等函数