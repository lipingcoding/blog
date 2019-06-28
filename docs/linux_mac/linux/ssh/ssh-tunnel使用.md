# ssh-tunnel使用

实验室的服务器集群, 分为管理节点 hn 和计算节点 node1~14, 只能通过管理节点才能登录到计算节点, 如果使用 vnc 或者想利用本地浏览器打开运行在计算节点的 Jupyter Notebook, 必须通过 ssh-tunnel. 下面介绍下具体使用.



### VNC

登录到计算节点后, 比如 node2, 利用 vncserver 开启一个 server, 会给定一个 id, 相应的端口就是 5900+id, 比如 id是 3 的话, 那么开启的 vncserver端口就是 5903.

在本地运行

```
ssh -L 8889:node2:5903 hn
```

注意, 我的代码可以直接写 hn, 是因为我在 ~/.ssh/config 中进行了配置, 否则需要写 ip地址. 这样, 在本地就可以利用vnc client software, 比如 Mac 自带的 Screen Sharing, 访问 localhost:8889.

这就是 ssh-tunnel, 也叫 port forwarding, 这里用到的是 local forwarding. 本地 8889 端口侦听到的内容都会经过 hn 被转发到 node2:5903.

### Jupyter Notebook

登录到计算节点后, 比如 node2, 输入 `jupyter notebook`, 按道理, 使用和上面 vnc 一样的方法 , 应该就能在本地打开, 但是不行. 经过测试, 我发现, 在 hn 节点是能打开计算节点上运行的 jupyter notebook. 这样, 就可以用两个 tunnel 了, 将本地的端口先转发到 hn, 再从 hn 转发到计算节点, 相当于跳了两次, 或者可以理解为 tunnel chain.

举个例子, 比如在 node2 上开了 jupyter notebook, 端口是默认的 8888, 那么运行

```
ssh -L 9001:localhost:9002 hn ssh -L 9002:localhost:8888 node2
```

有必要解释一下这里的两个 localhost . 第一个 localhost 是因为, 第一个 ssh, 是从本地 ssh 到 hn, 通过 hn 将本地的 9001 端口转发到 hn的 9002, 9002 相对于 hn来说当然是 localhost了. 理解了第一个 localhost, 第二个自然也就明白了.