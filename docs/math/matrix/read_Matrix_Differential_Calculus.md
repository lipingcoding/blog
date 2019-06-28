读 Byod 的凸优化时, 多次遇到对矩阵求导, 遂决心系统学习下. 于是便在积灰已久的两本常备工具书  < matrix analysis > 与 < matrix computation > , 竟然都没有过多提及. 一番搜索, 终于找到一本< Matrix Differential Calculus with applications in Statistics and Econometrics >. 花了几天时间研读了部分, 真可谓酣畅淋漓, 特与大家分享.

<!-- more -->

第一遍理解不深, 没写读书笔记(懒, 都是借口), 记录下思路.



1. 上来第一章先讲了很多矩阵的结论, 后面用的不多. 

2. 第二章主要讲 Kronecker Product 和 vec 操作, 很有用, 后面求导经常用到. 

3. 第四章讲一些拓扑, 为后面可微作准备.

4. 第五章正式定义可微,一阶微分, 这很关键, 后面具体求导数时其实都是通过微分来求的

   第八章和第九章的顺序佐证了:通过微分来求导数

5. 第八章求了常见的函数的一阶微分

6. 第九章接下来求导数或者 Jacobian matrices



 



----------

2018-12-04 第二次读, 做点总结

**记号**

- $x,y,z$之类代表向量
- $X,Y,Z$ 之类代表矩阵
- $\xi,\eta$  之类代表标量

------

# 一些定义

## $f: R^n \rightarrow R^m$

 **定义** 若对任意的 $u$, 有 $f(x+u)=f(x)+A(x)u+R(x,u)$  s.t. $\frac{R(x,u)}{\|u\|}\rightarrow0 $ 当  $\|u\|\rightarrow 0$ 时, 则称 f 在 x处可微, 记 $A(x)=Df(x)$ , $df(x) = A(x)u$ 称为微分. 此时, $Df$也记作 $\frac{\partial f}{\partial x'}$ , 称为 Jacobian. 

**求法** 可以证明, $Df_{i,j}= \frac{\partial f_i}{\partial x_j}$

​                                                                                              

## $F: R^{n\times q} \rightarrow R^{m\times p}$

**定义** 若对任意的 $u$, 有 $\text{vec} F(X+U)=\text{vex} F(X)+A(X)\text{vec} U+\text{vec} R(X,U)$  s.t. $\frac{R(X,U)}{\|U\|}\rightarrow0 $ 当  $\|U\|\rightarrow 0$ 时, 则称 F 在 x处可微, 记 $A(X)=DF(X)$ , 由 $\text{vec} dF(X) = A(X)\text{vec}U $ 定义的 dF(x) 称为微分.

等价于 $DF=\frac{\partial \text{vec}F }{\partial\text{vec}X'}$ 





综合以上两种定义, 可以发现

$DF: mp\times nq$

$df: m\times p$  始终与函数值形状相同



此外还有一个记号经常用到, $\frac{\partial F(\xi)}{\partial \xi}$

-------



# tr, vec, Kronecker积有关的结论

- $tr(A'B)=(\text{vec}A)'\text{vec}B=\sum_{i,j}a_{i,j}b_{i,j}$
- $(AC)\otimes (BD)=(A\otimes B)(C\otimes D)$
- $tr (A)tr(B)=tr(A\otimes B)$
- $\text{vec}ABC=(C'\otimes A)\text{vec}B$





两个无中生有的技巧

- 对于 scalar $\phi$ : $\phi = tr(\phi)$, 然后经常用到 $tr(AB) = tr(BA)$ , $tr(A) =tr(A')$
- 对于向量 $u$: $u = vec(u)$, 然后用 $vec(ABC) = (C'\bigotimes A) vec(B)$,  

---------

# Some important differentials

- $d|F| = tr(F^\#dF)=|F|tr(F^{-1}dF)$ 
- $dF^{-1}=-F^{-1}(dF)F^{-1}$
- 

​                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
