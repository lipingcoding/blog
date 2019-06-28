实验室或者公司的服务器一般只能在内网使用, 在外网如果想访问的话: 一般有两种方法, 一种是实验室内准备了一台具有公网固定 ip 同时又接入内网的跳板机, 一种是在外网有一台具有公网固定 ip 的服务器, 通过反向隧道(远程转发)的方式进行内网穿透, 本文对后一种方式进行介绍.

## 基本使用

假设内网有一台服务器 hostA(能主动连接外网, 但不能被外网访问), 外网有台具有公网固定 ip 的服务器 hostB, 家里的笔记本是 C.

所谓反向隧道就是指用内网的服务器 hostA 主动去连接外网的 hostB, 建立这个隧道, 并保持隧道连通, 然后就可以在家里通过 hostB, 来连接内网的 hostA 了.

### Step 1: 在 A 上建立隧道

```
# 登录到 hostA 上
ssh -R 2200:localhost:22 userB@hostB
```

上面这一步, 在 hostB: 2200 与 hostA:22 之间建立了隧道, 之后, 访问 hostB:2200 就相当于访问 hostA:22. 注意, 这里的 22不能改变,因为 ssh 的端口就是 22, 但是 2200 能改为其他的端口(不能过小, 容易与系统冲突)

### Step 2: 使用

```shell
#先登录到 hostB
ssh userB@hostB
#访问 hostB 的 localhost, 就能登录到 hostA
ssh -p 2200 userA@localhost
```

## 进阶

上面这种基本配置还有些问题

- ssh 建立的隧道有时候不太稳定, 长时间没有数据传输可能就会断开, 所以我们需要一个能自动保持连接的升级版 ssh — [autossh](https://www.harding.motd.ca/autossh/), 并且可以将命令写在一个脚本中
- 每次登录都得输入用户名, 端口什么的, 可以在 ~/.ssh/config 中配置.

下面给出我的脚本及相关配置文件

```shell 
#! /usr/bin/bash
# 内网服务器上建立隧道的脚本 create_tunnel.sh
ID=userB
HOST=123.129.186.240

autossh -Nf -M 3000 -R 2200:localhost:22 ${ID}@${HOST} -i /lustre/home/lpwang/.ssh/wanpeng_rsa
#个人笔记本上 .ssh/config
# 这样就可以直接 ssh hostB 登录到 hostB 上了
Host hostB
	HostName 123.129.186.240
	User userB
	IdentityFile ~/.ssh/id_rsa # 配置相应私钥
#Host B 上 .ssh/config
#这样登录上 Host B后, 就可以直接 ssh lab
Host lab
	HostName localhost
	User userA
	Port 2200
	IdentityFile ~/.ssh/id_rsa
```