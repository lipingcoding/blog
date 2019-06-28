Pytorch中定义一个层时, 需要继承 nn.Module, 一个层通常会有两类参数, 一种是可学习的参数, 也就是反向传播后会改变的参数, 另一种是不可学习的参数. 在 `__init__` 中需要注册这两类参数.





## 可学习参数

有两种方法, 举例说明

```
self.weight = Parameter(torch.Tensor(num_features))
self.register_parameter('weight', torch.Tensor(num_features))
```

## 不可学习参数

必须显式地 register

```
self.register_parameter('weight', torch.Tensor(num_features))
```

## 实验验证

```python 
from torch.nn import Module
from torch.nn.parameter import Parameter

class mylayer(Module):
	def __init__(self, weight = None):
		super(mylayer, self).__init__()
		if weight:
			self.weight = Parameter(torch.tensor(weight))
			self.register_parameter('weight2', Parameter(torch.tensor(weight)))
		else:
			self.weight = torch.tensor([0.1, 0.2])
			self.register_buffer('weight2', torch.tensor([0.1, 0.2]))
            
            
layer1 = mylayer([1.0, 2.0])
layer2 = mylayer()
print('layer1', dict(layer1.named_parameters()))
print('layer1', dict(layer1.named_buffers()))
print('layer2', dict(layer2.named_parameters()))
print('layer2', dict(layer2.named_buffers()))
```

实验结果说明 `self.weight = torch.tensor([0.1, 0.2])` 不能起到 register_buffer 的目的, `self.register_parameter` 必须传入 None 或者 Parameter, 而不能是 tensor, 所以这种方法不提倡用, 很繁琐.



------