---
title: 矩阵三大分解
date: 2018-12-05 12:27:03
categories: matrix	
tags: [matrix, 矩阵]

---

一文彻底弄懂矩阵三大分解: Schur, Jordan 和 SVD 分解. 这三种分解主要用于理论证明. 

后续, 我会再总结用于数值计算的若干分解, 比如 QR分解, LU 分解等. 

<!--more-->

# 三大分解 

|      | Schur                   | Jordan       | SVD                                |
| ---- | ----------------------- | ------------ | ---------------------------------- |
| 形式 | $S^*AS=M$               | $S^{-1}AS=M$ | $A=S\Lambda^{1/2}T'$               |
| A    | 任意方阵                | 任意方阵     | 任意矩阵m*n                        |
| S,T  | Unitary ($S^*S=I$)      | 可逆         | $S:m*r, T: n*r,S'S,T'T=I_r$        |
| M    | 上三角, 对角线为A特征值 | 若当块       | $\Lambda$ 是由正特征值构成的对角阵 |



Schur 和 Jordan 分解很像, 只不过, Schur 强调 S 的结构, Jordan 强调 M 的结构. 



## 三大分解的特例(只是方便记忆)

- 特征值分解(基于 Schur ): 若A是实对称阵, 则 S为实正交阵, M 为对角阵.
- Jordan 分解中若 A 有n 个不同特征值, 则 M 为对角阵
- 正交分解:若A是实对称阵,且有n 个不同特征值,则 S是对角阵
- full rank factorization: $A=ST$, A:nxm, rank(A) = r,  S,T 分别 列,行满秩, 

------

# 应用

主要用于理论证明, 下面举若干例子进行说明

### 1.对称矩阵正定/半正定当且仅当其特征值均为正/非负

充分性可由特征值分解证明, 必要性由定义可证明

### 2.Moore-Penrose inverse 





<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

