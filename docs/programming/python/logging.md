刚开始写程序, 只会在需要输出结果的时候 print 下, 然后在 debug 时, 临时添加些 print 语句. 慢慢地, 我们会开始考虑程序的鲁棒性以及用户的使用体验, 需要输出一些日志信息, 这时候就需要一个日志管理系统了. python 标准库中的 logging 模块就是我们需要的, 本文对其使用加以介绍.

日志信息根据严重程度, 分为

- debug
- info
- warnning
- error
- critical

但不是所有的信息都会输出, 有个 level 的设定, 只有不低于该 level 的信息才会被输出, 默认的 level 为 warnning.

## 低级用法

### 配置

在程序正式开始之前, 我们需要完成一些设置, 一般包括如下内容

- 输出文件名
- level
- 输出格式

配置有两种方法

```
#第一种
logging.config(filename='xxx.log', format='%(levelname)s:%(message)s', level=logging.DEBUG)

#第二种
logging.setLevel(logging.DEBUG)
```

### 简单使用

在程序中通过 logging.info, logging.warnning 等函数就能简单使用

## 高级用法

之前介绍的低级用法中, 一般是程序只有个 .py 文件, 在程序中通过 logging. error( )就可以输出相关日志信息. 但是实际中的程序可能有多个文件, 彼此还有层级关系. 如果只是在每个 .py 文件中单独输出日志信息, 那将非常混乱, 而且没有任何逻辑关系. . 所谓的高级用法主要是为了解决这种情况, 即多模块使用.

首先需要弄清楚 logging 中的四类对象

- logger, 最核心的类, 可以理解为日志发生器
- handler, 对于不同 level 的日志信息, 我们希望输出到不同地方, 比如只希望将错误输出到屏幕上, 这就需要用 handler 来解决
- filter
- formatter, 用于设置输出字符串格式

四类对象之间的关系为

- logger 可以有多个 handler 和 formatter
- handler 需要 setFormatter
- Handler 可以有多个 formatter

### logger

logger 的引入就是为了实现多模块日志, 通过让 logger 具有继承关系, 子 logger 默认配置和父 logger 相同. logger 的继承关系是通过名称隐式完成. 所谓的隐式是指: 创建 logger 时, 你不需要显式声明其父 logger.

```
main_logger = logging.getLogger('main')
sub_logger = logging.getLogger('main.sub')
#这样 sub_logger 就是 main_logger 的子 logger了
```

logger 的接口分两类, 一类是配置功能

- Logger.setLevel( )
- Logger.addHandler( ) Logger.removeHandler( )
- Logger.addFilter( ) Logger.removeFilter( )

另一类就是发送具体日志消息

- Logger.debug( )
- Logger.info( )
- Logger.warn( )
- Logger.error( )
- Logger.critical( )

logger 调用上述函数后, 将日志的严重程度与 logger 自身的 level 对比, 不低于其 level 的消息会被分发到 handler, 每个 handler 也有其 level, 不低于其 level 的消息就会被输出. 注意, 这样每条消息可能被输出到多个日志文件中, 因为不同 handler 之间是相互不干扰的, 被一个 handler 输出后, 还是会被其他 handler 处理.

### handler

handler 是日志最终的输出者, 决定了消息的最终去向, 一般和文件或者标准输出设备等关联, 常用的有

- logging.FileHandler( )
- logging.StreamHandler( )

### formatter

之前说过 handler 是日志消息具体的输出者, 既然需要输出, 就会涉及到输出格式, 例如:

```python 
import logging
import sys

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
ch = logging.StreamHandler(stream=sys.stdout)
ch.setLevel(logging.DEBUG)
logger.addHandler(ch)
ch1 = logging.StreamHandler(stream=sys.stdout)
ch1.setLevel(logging.INFO)
logger.addHandler(ch1)
fmt = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
ch.setFormatter(fmt)
ch1.setFormatter(fmt)
logger.info('hi')
```