只要你需要在 gpu 上运行 pytorch, 你就(至少)需要解决以下若干问题:

- 数据如何送到 gpu 上
- 模型(的参数)如何放到 gpu 上
- 模型的参数值如何 save/load 以方便 resume_train 或者 eval

本文将提供关于 pytorch (多) gpu 运行, 你所需要知道的一切!

# 基本使用

单个 gpu 运行是多个 gpu 运行的特例, 所以我们主要介绍多个 gpu 如何使用.

为了在多个 gpu 上运行, 首先, 数据(包括样本和标签)必须在 gpu 上, 模型也必须在 gpu 上. 按理说, 要想在多个 gpu 上跑, 应该把数据和模型都拷贝到多个 gpu 上, 但其实不用. 只需要将它们放到一张 gpu 上就行.

以一个 train.py 的框架为例来说明

```
import torch
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--cuda', default=True, type=bool)
args = parser.parse_args()


"""
通过设置默认 Tensor 类型, 可以使得数据的 Tensor 都在 cuda:0 上
此步可以封装成一个函数 
"""
if torch.cuda.is_available():
    if args.cuda:
        torch.set_default_tensor_type('torch.cuda.FloatTensor')
    if not args.cuda:
        print("WARNING: It looks like you have a CUDA device, but aren't " +
              "using CUDA.\nRun with --cuda for optimal training speed.")
        torch.set_default_tensor_type('torch.FloatTensor')
else:
    torch.set_default_tensor_type('torch.FloatTensor')
    
    
    
def train():
	"""
	下面假设你有了一个模型, 并且初始化了一个 net
	你只需要在 定义 optim 前, 进行如下
	"""	
    net = build_net(..., phase = 'train', ...)
    net = torch.nn.DataParallel(net) 
    net = net.cuda() 
    
    optimizer = optim.SGD(net.parameters(), lr=args.lr, ... )
    
    ...
    
if __name__ == '__main__':
    train()
```

重点解释如下两行代码:

```
net = torch.nn.DataParallel(net) 
net = net.cuda()
```

#### DataParallel

DataParallel 是一个 wrapper, DataParallel 字面上是并行(处理)数据, 它告诉 pytorch : 等会儿在进行模型运行的时候, 需要将 net 并行地 apply 到 data 上面.

### .cuda()

.cuda 这个语句我们经常看到, 它是什么意思呢? 就是把对象拷贝到 gpu 上, 由于没有提供具体的 device id, 它会拷贝到默认的 cuda device 上, 也就是 cuda:0 上. 所以 net = net.cuda( ) 就是将网络布置到 cuda: 0 上.

#### 具体运行

现在我们可以考察模型到底是怎么运行的了. 前面我们已经将数据和模型拷贝到 cuda:0 上了, cuda:0 也就是它们的原始 device. 由于前面申明了 DataParallel, pytorch 会在多个 gpu (稍后会介绍如何指定)上并行地将 net apply 到 data 上. 为了达到这个目的, 需要完成如下步骤:

1. 将数据从 cuda:0 上拷贝到多个 gpu 上
2. 将模型以及参数从 cuda:0 上拷贝到多个 gpu 上
3. 在多个 gpu 上进行 forward, 并计算 loss
4. 将 loss 汇总到 cuda:0 上
5. 在 cuda:0 上进行 backward

## 指定 gpu

前文中, 我们一直都没有涉及具体指定 gpu, 现在, 我们就来仔细考察这个问题.

#### CUDA_VISIBLE_DEVICES

首先, 我们需要知道 pytorch 是如何知道电脑上的 gpu 的. 系统有个变量 `CUDA_VISIBLE_DEVICES` , 它指明了哪些 gpu 是 pytorch 是可以**看见**的.

比如, 你有 4 张 gpu, 编号为 0~3, 如果你 `CUDA_VISIBLE_DEVICES = 1, 3`, 那么 pytorch 会认为你只有两张 gpu, 它会认为 gpu 1 是 cuda:0, gpu 3 是 cuda:1. 所以 cuda:0, 不一定是 gpu: 0.

#### 默认 cuda device

`xx.cuda()` 如果不指定 device 时, 就会将 `xx` 拷贝到默认的 cuda device , 也就是 cuda:0 (不一定是你的第一张 gpu).

#### torch.nn.DataParallel()

其实 `DataParallel` 这个函数还有两个可选参数 `device_ids, output_device`, 前者是指在哪些 gpu 上运行, 默认是全部可见 gpu 上, 后者是指最终将 loss 汇总到哪个 gpu 上, 默认是 cuda:0 .

## 最佳实践

根据我的经验, 最好的使用方法就是:

1. 利用 torch.set_default_tensor_type 设置默认 Tensor, 这样, 数据会在 cuda:0 上
2. 利用 torch.nn.DataParallel 声明
3. 利用 net = net.cuda( ), 将模型布置到 cuda:0 上
4. 在命令行调用时, 形如 `CUDA_VISIBLE_DEVICES = 2,3 python train.py` , 在程序外部指定具体 gpu

还有一些细节可以考察, 比如:

- 如果最开始模型和数据不在同一个 gpu 上会怎样
- 如果最开始模型和数据所在的 gpu 不在 DataParallel 中的 device_ids 中会怎样

### 注意:

多 gpu 运行的过程导致一些问题:

- 在 forward 的过程中, 对于网络中参数的更改是无效的,因为 forward 结束后, gpu 上的网络就会被清除.
- 会导致 gpu 内存使用出现 imbalanced 的情况
- 反复拷贝模型参数

# 模型的保存和加载

在训练的过程中, 会保存模型当前状态, 也就是 stat_dict, 将模型中的参数, 以字典的形式序列化到硬盘上. 涉及到 gpu 的时候, stat_dict 的保存和加载会比较复杂, 可以参考 [官方 doc](https://pytorch.org/tutorials/beginner/saving_loading_models.html?highlight=load_state_dict).

为什么模型的保存和加载会有这些门道呢? 原因很简单, stat_dict 序列化后保存在硬盘上, 反序列化是在 cpu 上进行的. 加载时, 希望加载到 gpu 上, 所有这一步就需要用户定义.

不过, 经过 DataParallel 包装后的模型, 会很简单, 可以在任何地方随意加载, [官方 doc](https://pytorch.org/tutorials/beginner/saving_loading_models.html?highlight=load_state_dict) 也有描述. 但是这地方有个坑, 我们通过一个 demo 来说明

先定义一个 模型

```
import torch
from torch import nn

class MyModule(nn.Module):
    def __init__(self, input_size, output_size):
        super(MyModule, self).__init__()
        self.input_size, self.output_size = input_size, output_size
        self.fc = nn.Linear(self.input_size, self.output_size)

    def forward(self, x): 
        return self.fc(x)
In [14]: net = MyModule(3,5)                                                                                                                           

In [15]: torch.save(net.state_dict(), 'net_parm.pth')                                                                                                  

In [16]: for k in torch.load('net_parm.pth'): 
    ...:     print(k) 
    ...:                                                                                                                                               
fc.weight
fc.bias


In [19]: paral_net = torch.nn.DataParallel(net)                                                                                                        

In [20]: torch.save(paral_net.state_dict(), 'paral_net_parm.pth')

In [24]: for k in torch.load('paral_net_parm.pth'): 
    ...:     print(k) 
    ...:                                                                                                                                               
module.fc.weight
module.fc.bias
```

可以发现, 经过 DataParallel 包装后的网络, 序列化后, state_dict 的键值 多了一个 `.module`, 如果这个序列化文件之后被一个未经DataParallel 包装的网络 load 后, 就会报错.

```
In [25]: new_net = MyModule(3,5)                                                                                                                       

In [26]: new_net.load_state_dict(torch.load('paral_net_parm.pth'))                                                                                     


RuntimeError: Error(s) in loading state_dict for MyModule:
	Missing key(s) in state_dict: "fc.weight", "fc.bias". 
	Unexpected key(s) in state_dict: "module.fc.weight", "module.fc.bias".
```

为什么会这样呢?

```
In [27]: net = MyModule(3,5)                                                                                                                           

In [28]: paral_net = torch.nn.DataParallel(net)                                                                                                        

In [29]: torch.save(paral_net.module.state_dict(),  'paral_net_parm.pth')         # 多了一个 .module                                                                      

In [30]: for k in torch.load('paral_net_parm.pth'):  
    ...:     print(k) 
    ...:                                                                                                                                               
fc.weight
fc.bias

In [32]: paral_net.module.load_state_dict(torch.load('paral_net_parm.pth'))    # 也多了一个 .module
```

通过代码可以发现, DataParallel 相当于将原来的 net 包装了一个 module, 所以对于 DataParallel 的模型, 有两种层次的 save/load, 只要相互匹配即可!