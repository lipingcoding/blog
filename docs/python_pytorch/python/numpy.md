## 广播

Broadcasting two arrays together follows these rules:

1. If the arrays do not have the same rank, prepend the shape of the lower rank array with 1s until both shapes have the same length.
2. The two arrays are said to be *compatible* in a dimension if they have the same size in the dimension, or if one of the arrays has size 1 in that dimension.
3. The arrays can be broadcast together if they are compatible in all dimensions.
4. After broadcasting, each array behaves as if it had shape equal to the elementwise maximum of shapes of the two input arrays.
5. In any dimension where one array had size 1 and the other array had size greater than 1, the first array behaves as if it were copied along that dimension

## 

## Ndarray 与 list 对比 

```python  
In [11]: [1,2] + [3,4]
Out[11]: [1, 2, 3, 4]

In [12]: import numpy as np

In [13]: np.array([1,2]) + np.array([3,4])
Out[13]: array([4, 6])
```

可以看出 + 作用于 list 和np.array 的区别

那为了由 [[1,2], [3,4]] 得到 [1, 2, 3, 4] 是不是 `sum=([[1,2], [3,4]])` 就可以呢? 不行. `因为` Signature: sum(iterable, start=0, /), 它会依次将 0 与 [1, 2], [3,4] 相加, 而 list 不支持广播, 所以 int 不能与 list 相加.  

`sum=([[1,2], [3,4]], [ ])` 就可以了. 





## Ndarray扩维

先看效果

```python  
In [30]: np.array([[1,2,3],[4,5,6]])[None]
Out[30]: 
array([[[1, 2, 3],
        [4, 5, 6]]])


In [35]: np.array([[1,2,3],[4,5,6]])[:,None]
Out[35]: 
array([[[1, 2, 3]],

       [[4, 5, 6]]])



In [34]: np.array([[1,2,3],[4,5,6]])[:]
Out[34]: 
array([[1, 2, 3],
       [4, 5, 6]])

In [36]: np.array([[1,2,3],[4,5,6]])[:][None]
Out[36]: 
array([[[1, 2, 3],
        [4, 5, 6]]])
```

   

首先, 这里的 None, 其实也就是 np.newaxis, 换成np.newaxis容易理解多了. 