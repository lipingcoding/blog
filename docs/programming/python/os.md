利用 python 编程的过程中, 经常要与系统打交道, 比如文件, 路径, 调用系统命令等. 不同操作系统往往存在差异, 比如路径分隔符. 幸运的是, python 预定义了很多函数, 比如 os.sep 就是当前平台的路径分隔符. 我们可以利用它们写出roboust 的代码. 本文, 对此做个总结, 方便日后查找.





### 获取系统变量

```
os.path.expandvars('$PATH')
os.path.expandvars('$HOME')
```

### 路径相关

os.path 有很多和路径相关的函数

```python 
os.path.join(img_dir, img_name) #得到 image的绝对路径
os.path.expanduser(a_path) #将 a_path 中的 ~ 变成例如 /home/users/lpwang
# os.path.expanduser('~') = os.path.expandvars('$HOME')
```

