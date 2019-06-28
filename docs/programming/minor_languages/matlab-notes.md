---
title: matlab_notes
date: 2018-11-22 21:33:09
categories: matlab
tags: [matlab, 编程]

---

matlab虽然是数学软件, 但据我观察, 学数学的同学用这个的其实并不多, 最多只是在数学建模的那几天, 翻翻文档, 画画图. 另外, matlab 严格说并不能算一门编程语言, 相比之下, 还是学python 划算. 

<!--more-->

本篇有待整理与进一步研究!

# 前言

但其实学习成本不大, 与其偶尔碰到, 一碰到就慌, 不如花点时间系统学习下. 但是问题是, 现在很多知识, 学了, 但不是经常用到, 等到用的时候已经忘了. Matlab 对我现在来说就是这种情况.  对于这种问题, 我现在的想法是, 提前学, 作好笔记, 重点是记录特殊的地方, 以及遇到问题去哪儿查. 我想这也是知识爆炸时代的学习之道吧.



# 帮助文档

```matlab
help fprintf
doc fprintf  % 类似 c 的 printf
lookfor fprintf 
helpbrowser 
```



还可以在 matlab 界面右上方搜索 key word , 进行非精确搜索. 

# 常用命令

```
who 					当前定义的变量名
whos					当前定义的变量名
clear 					清除所有变量
claer var_name 			清除指定变量
clc 					清屏

```



# 特点

- 一行语句，如果没有分号结尾。那么matlab 会将结果输出。
- 如果一行语句过长。需要在跨越多行来写的话。可以在行末加上三个点
- 在交互式窗口,如果要写多行语句, 比如 for 循环后面, 可以在行尾输入shift + enters
- 变量名必须以字母开头, 不能以下划线开头
- 数字默认为 double 类型 
- 单个字符, 字符串都用单引号
- 下标从 1 开始, 对于区间是左右都包含. 为了表示最后一个下标, python 中用 -1, matlab 用 end 
- 下标索引用括号而不是中括号
- 调用函数时，如果没有参数，可以省略括号, 但匿名函数必须加括号, 否则返回函数内容 
- 



# 输入与输出

Input , disp, fprintf 

### 文件

save , load 适用于矩阵

fopen 更一般 

### .mat 文件

不只保存数据, 还可以保存变量

# 作用域

script 和 command line 的作用域是共通的

# 随机数

matlab 每次启动的 seed 都一样

# 

# use matlab in terminal(mac)

`/Applications/MATLAB_R2017a.app/bin/matlab -nojvm` 

much faster and more fluent than GUI, save RAM at the same time. 

# Differences

!=   ->  ~= 



# 矩阵

变量, 向量, 矩阵在 matlab 中都是矩阵.

有三个函数 length, size, numel 

1. numel 返回元素的个数
2. size 返回形状, 
3. length , 对于 向量或者变量, 返回长度, 也就是元素的个数,矩阵返回行数和列数中的最大值



# Function 

根据 **返回值** 进行函数重载. 

```matlab
>> data = [1,2,3,-3]
data =
     1     2     3    -3
>> t = max(data)
t =
     3
>> [t, i] = max(data) % t, i = max(data) not works 
t =
     3
i =
     3
```



# Index 

- index starts from 1 , and `1:3` includes 3

- Use '( )' rather than '[ ]' 

- Use 'end' rather than -1 in python to indicate the last index on some dimension. Accordingly , end - 1 indicates the second to last. 




# Calculations for arrays

- \+ - , etc. can perform elementwise operations 
- '*' is matrix multiplication.  '**' is elementwise 



# Plot

### basic

- hold on: keep the figure there to plot a new figure on it 
- hold off: 
- close all: close all figures 

## funciton

- plot( ) : plot 2-d figure 
- plot3( ): 3-d 



### GUI method

choose variable in workspace and plot, which can generate specifical codes automatically 





```matlab
plot(sample, v1, 'ro-', 'LineWidth', 4)
```



# file

### .mat file: save variables 

```matlab
save filename.mat var1 var2 % or save(filename.mat, var1, var2)
save filename.mat % save all variables in this workspace

```



the same way for `load` function 



### .m file: script 

### livescript , 类似 jupyter notebook  







任何非匿名函数必须在文件中定义。每个此类函数文件都包含一个必需的主函数（最先显示）和任意数目的局部函数（位于主函数后面）。主函数的作用域比局部函数更广。因此，主函数可以从定义这些函数的文件外（例如，从 MATLAB 命令行或从其他文件的函数中）调用，而局部函数则没有此功能。局部函数仅对其自己的文件中的主函数和其他局部函数可见。

<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>



