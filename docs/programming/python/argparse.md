

一般利用 argparse 模块处理 python 命令行参数, 本文介绍下 argparse 的相关用法.

argparse 使用分三步:

- `parser = argparse.ArgumentParser( )` # 创建解析器 parser
- `parser.add_argument()` # 添加多个参数
- `args = parser.parse_args()`#对参数进行解析

经过如上三步, 命令行参数就解析到 args 中, 后面在程序中通过 args 的属性获取命令行参数

## 创建 parser

利用 `argparse.ArgumentParser()` 创建 parser 时, 一般传入 description, 说明程序的主要功能.

## 添加参数

参数分为两类

- 可选参数, 通过 `-f` 或者 `--foo` 形式指定
- 位置参数

添加参数时有如下选项较为常用

- nargs 指定参数个数, 形成列表, 可选值有:
  1. ‘?’ 0 个或 1个
  2. ‘*’ 1 个或多个
  3. 0 个或 1 个或多个
  4. argparse.REMAINDER 剩余全部
- dest 指定该参数作为 parse_args( ) 返回值的属性名
- type 传入一个函数或者类型, 因为默认解析类型为 str