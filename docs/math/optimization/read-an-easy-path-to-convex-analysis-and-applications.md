---
title: read an_easy_path_to_convex_analysis_and_applications
date: 2018-12-17 14:42:16
categories: optimization
tags: [convex, analysis, reading, optimization, convex optimization]

---

感谢 njw 同学推荐的  an_easy_path_to_convex_analysis_and_applications. 

<!--more-->

# 第一章

### Bolzano-Weierstrass theorem

​	$R^n$ 中有界序列都有收敛子序列

-----

### 紧

$R^n$ 中集合紧(compact),  $\iff$ 有界闭

------



### Proposition 1.13 

A,B are two subsets of $R^n$ 

1. If A or B is open, then A+B is open
2. If A is closed and B is compact,  then A+B is closed 

*Proof*: 1. 设 $z = x+y \in A+B$, 不妨设 A 是开集, 则存在邻域 $B_r(x) \subset A$, 断言 $B_r(z)\subset A+B$, 因为任意 $t \in B_r(z)$, $t = t - y + y$, 其中 $ t-y \in B_r(x) \subset A, y \in B$.   

2. 设 $\{x_n+y_n\}$ 是 A+B 中的收敛序列, 其中 $\{x_n\}\subset A, \{y_n\}\subset B$ . 只需证其极限也在 A+B 中即可. 因为 B 紧, 所以有界, 从而 $\{y_n\}$ 有界, 又 $\{x_n+y_n\}$ 有界, 从而 $\{x_n\}$ 有界, 由 Weierstrass 定理, $\{x_n\}$ 有收敛子列 $\{x_{m_n}\}$ ,  $\{y_{m_n}\}$ 又有收敛子列. 故可不妨设  $\{x_{m_n}\}$ ,  $\{y_{m_n}\}$ 都收敛, 且分别收敛到 $x,y$ . 则 $\{x_{m_n}+y_{m_n}\}$ 收敛到 $x+y$, 所以$\{x_n+y_n\}$  也收敛到 $x+y\in A+B$ . 所以 A+B 闭. 

   *相同的方法可以用到练习 1.1*

----

### Weierstrass 存在性定理

设$f: \Omega \rightarrow R$ 连续, $\Omega \subset R^n$ 非空紧, 则存在 $u,v $ s.t 

- $f(u) = inf f(x)$
- $f(v) =supf(x)$ 



----

#### Proposition 1.29

若 $\Omega \subset R^n$ 是凸集, 则 $\text{int} \Omega, \overline{\Omega}$ 也是凸集. 

后一部分简单, 只证明前一部分.

设 $a,b \in \text{int}\Omega $, 则存在 $a$ 的邻域 $V\subset \Omega$, 则 $\lambda a + (1-\lambda )b \in \lambda V+b\subset \text{int} \Omega$



----

### Lemma 1.30 的证明

{%asset_img lemma_1_30.png %}



-----

### Proposition 1.31

{% asset_img prop_1_31.png %}

---

### 凸函数的几个等价

f is convex function $\iff$

1. epi(f) is convex set
2. f(x+td) 关于 t 凸
3. 若 f 可微, 则等价于 f' 非减



*Proof of 3*

{%asset_img 1_45.png %}

-----

{%asset_link exercise_1.html \ %}

<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

