现在一般利用 anaconda 新建虚拟环境, 进行正常的配置后, 如果你打开 jupyter notebook, 会发现你新建的环境不在可选的 kernel 中.



这时可以运行如下命令

```
python -m ipykernel install --name=your_env_name
```

即可将 conda 所建的虚拟环境添加为 kernel.