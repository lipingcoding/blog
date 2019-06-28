---
title: matrix rank
date: 2018-12-12 12:07:57
categories: matrix
tags: [matrix, rank, inequality]

---

本文主要对 matrix rank 做个总结, 主要是与秩相关的各种不等式与等式. 

<!--more-->

# 秩的定义

 行,列向量组的极大线性无关组中向量个数分别称为行秩, 列秩. 

对于矩阵来说, 行秩 = 列秩. 

**Proof**: 经过行列重排后, A 可以写成 
$$
\begin{bmatrix}
W_{p\times q}&X\\\
Y& Z
\end{bmatrix}
$$
$[W,X]$是行极大线性无关组, $[W',Y']'$是列极大线性无关组. 

若 p<q, 则 W的列必然线性相关, 所以存在 $a$ 使得 $Wa=0$ , 又 $Y = BW$ , 所以
$$
\begin{pmatrix} W\\\Y\end{pmatrix}a = \begin{pmatrix} W\\\BW\end{pmatrix}a = 0
$$
与$[W',Y']'$是列极大线性无关组矛盾. 

-----

# 秩与逆

- 行,列满秩矩阵分别有左逆,右逆

  对行满秩矩阵来说, $Ax=e_i$ 是 consitent 的, 所以 存在 $AX =I$ , 列满秩可转置后证明



-----

# 乘积不变性

- 左,右乘可逆矩阵, 不改变秩 $rank(PA)\le rank(A) = rank(P^{-1}PA)\le rank(PA)$
- 左乘列满秩, 右乘行满秩不改变秩 (类似上面的方法证明)





----------

# Gramian matrix 

可以表示成 $A^TA$ 的矩阵称为 gramian matrix 

- $A=0\iff A^TA=0 \iff tr(A^TA)=0$

- $A^TA$ full rank $\iff A^TA$ positive definite $\iff A$ column full rank 

- $rank(A^TA) = rank(A) = rank(A^T) = rank(AA^T)$ 

  设 $A=\begin{pmatrix} A_1 A_2 \end{pmatrix}$ ,其中 $A_1$ 列满秩, 且秩与 A 相同, 则 $A=A_1\begin{pmatrix}I B \end{pmatrix}$  令
  $$
  T = \begin{pmatrix} I & 0 \\\ -B & I \end{pmatrix}
  $$
   则 $rank(A^TA)=rank(TA^TAT^T)=rank(A_1^TA_1)=rank(A_1)=rank(A)$





-----

# rank inequality

- $\text{rank}(AB)\le \text{rank}(A) ,\text{rank}(AB)\le \text{rank}(B)$ : 因为既可以将 AB的行看作B 的行的线性组合, 又可以将 AB的列看作B 的列的线性组合

- $\text{rank}((A,B))\le \text{rank}(A) +\text{rank}(B)$

- $\text{rank}(A+B)\le \text{rank}(A) +\text{rank}(B)$: 因为 $A+B = (A,B)(I,I)^T$ ,再运用前两条

- $\text{rank}(A+B)\ge\text{rank}(A) -\text{rank}(B)$ : 加减本没有区别
  $$
  \text{rank}(A)= \text{rank}(A+B-B)\le \text{rank}(A+B) + \text{rank}(B)
  $$




此外还有两个大名鼎鼎的不等式:

- Sylvester inequality: $rank(AB)\ge rank(A)+rank(B) -n$ , n是 A的列数
- Frobenius inequality: $rank(ABC) \ge rank(AB)+rank(BC) -rank(B)$

证明以及更一般的结论可参考 {% asset_link THOME_AM.pdf THOME_AM.pdf %}





------




<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

