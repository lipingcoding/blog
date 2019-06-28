Tensor 是 pytorch 最基本的元素, 1.0 版本以后, Tensor 和 Variable 合并了.





## 构造

```
# 一般方法
torch.tensor(data, dtype=None, device=None, requires_grad=False)
# 注意, 只有浮点类型的 Tensor 才可以 require gradient
# torch.tensor() 总是拷贝数据


#构造函数隐含类型
torch.Tensor() # 生成默认类型的 Tensor, 默认类型可以通过 torch.set_default_tensor_type() 来指定, 默认为 torch.FloatTensor
torch.IntTensor()
torch.FloatTensor()
torch.DoubleTensor()

torch.cuda.FloatTensor()
torch.cuda.DoubleTensor()

# 还可以通过  torch.set_default_tensor_type('torch.cuda.FloatTensor')
```

## 与 numpy 相互转化

```python 
torch.from_numpy() # 与原来的 ndarray 共享内存, 只能是 cpu 上的 Tensor
torch.as_tensor(data, dtype=None, device=None) #如果 data 是 ndarray, 有 device 是 cpu, 不会 copy
```

