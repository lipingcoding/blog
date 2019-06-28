---
title: read_matrix_algebra
date: 2018-12-05 16:30:39
categories: matrix
tags: [matrix algebra, matrix, 矩阵, 读书]

---

最近又看到了一本好书, [*Matrix Algebra: Theory, Computations and Applications in Statistics*](http://mason.gmu.edu/~jgentle/books/matbk/)

[errata for first edition](http://mason.gmu.edu/~jgentle/books/matbk/materrata.htm)



<!--more-->

# Chapter 2

### Approximation of vectors

$x$ 是 n 维空间 $R^n$ 中的一个向量, 想在$R^n$ 的 k 维子空间 $\nu$ 中找一个向量来近似 $x$,  则 $x$在 $\nu$ 的投影  $u = \sum_{i=1}^k \langle x,u_i \rangle u_i$ (其中 $u_i$ 是 orthonormal basis) 是最优的, 即 

for any $v$ in space $\nu$ , $\|x-v\| \ge \|x-u\| $
$$
\begin{align}
\langle x-v, x-v \rangle &=\langle x-u+u-v, x-u+u-v \rangle \\
						&=\langle x-u, x-u \rangle +\langle u-v, u-v \rangle + 2\langle x-u, u-v \rangle
\end{align}
$$
如果没有第三项就 ok 了, 这就需要反复用到 $\langle x,v \rangle = \langle u, v \rangle$ , 从而消去第三项. 

$\langle x,v \rangle = \langle u, v \rangle$ 也很好证明, $v = a_1 u_1 + ... a_k u_k$, 则  $\langle x,v \rangle = \sum a_i \langle x, u_i \rangle = \langle u, v \rangle $ . 这个结论非常重要. 



----

2.3 节用向量定义的样本均值,方差的思路还挺有意思的



----

# Chapter 3

### 术语

|                              |            |
| ---------------------------- | ---------- |
| minor  / complementary minor | 余子式     |
| cofactor                     | 代数余子式 |
| adjugate                     | 邻接矩阵   |
| premultiply                  | 左乘       |
| postmultiply                 | 右乘       |
|                              |            |
|                              |            |
|                              |            |
|                              |            |









###  行列式的几何意义

p58

p296



 	

----

### permutation matrix

elementary permutation matrix: $E_{p,q}$ ,就是将单位阵的 p, q 行互换, 满足:

- $E_{pq}^T=E_{pq}$ 
- $E_{pq}E_{pq}= E_{pq}^TE_{pq}= I$, 可以这样理解:  $E_{pq}E_{pq}=E_{pq}E_{pq}I=I$ , 换了两次, 等于没换

general permutaion matrix: $E_\pi$ 等于一系列 elementary permutation matrix 相乘,满足:

- $E_\pi^TE_\pi = I$  

----

### rank inequality

- $\text{rank}(AB)\le \text{rank}(A) ,\text{rank}(AB)\le \text{rank}(B)$ : 因为既可以将 AB的行看作B 的行的线性组合, 又可以将 AB的列看作B 的列的线性组合

- $\text{rank}((A,B))\le \text{rank}(A) +\text{rank}(B)$

- $\text{rank}(A+B)\le \text{rank}(A) +\text{rank}(B)$: 因为 $A+B = (A,B)(I,I)^T$ ,再运用前两条

- $\text{rank}(A+B)\ge\text{rank}(A) -\text{rank}(B)$ : 加减本没有区别
  $$
  \text{rank}(A)= \text{rank}(A+B-B)\le \text{rank}(A+B) + \text{rank}(B)
  $$




-----



-----



<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>



