如果一个模型足够大, 导致一张 gpu 上都放不下整个模型, 更不要说, 放输入数据, 以及训练过程中的中间数据, 可不可以将模型分到多个 gpu 上.

我觉得这个问题确实存在. 即使能放下, 但是 batch_size 只能设置得很小, 这种情况下, 也可以考虑 split the model.

这个问题, pytorch 没有提供相关接口或者函数, 必须手动实现, 但是很简单, 以一个 demo 来说明, 这个 demo 同时使用了 DataParallel 和 split model 两个 tricks.

```
from torch import nn
import torch

class SubModule(nn.Module):
    def __init__(self, in_channels, out_channels):
        super(SubModule, self).__init__()
        self.conv1 = nn.Conv2d(in_channels, out_channels, 3, 1, 1)
    
    def forward(self, x): 
        print('SubModule, device: {}, shape: {}\n'.format(x.device, x.shape))
        x = self.conv1(x)
        return x
        
class MyModel(nn.Module):
    def __init__(self, split_gpus, parallel):
        super(MyModel, self).__init__()
        self.module1 = SubModule(3, 6)
        self.module2 = SubModule(6, 1)
            
        self.split_gpus = split_gpus
        self.parallel = parallel
        if self.split_gpus and self.parallel:
            self.module1 = nn.DataParallel(self.module1, device_ids=[0, 1]).to('cuda:0')
            self.module2 = nn.DataParallel(self.module2, device_ids=[2, 3]).to('cuda:2')
    def forward(self, x): 
        print('Input: device {}, shape {}\n'.format(x.device, x.shape))
        x = self.module1(x)
        print('After module1: device {}, shape {}\n'.format(x.device, x.shape))
        x = self.module2(x)
        print('After module2: device {}, shape {}\n'.format(x.device, x.shape))
        return x
```

后面有时间我再研究下 pytorch 多机多卡.



