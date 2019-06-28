一旦开始在服务器上开发, 就不可避免要接触到 ssh, 一个比较简单的使用方法是利用 Mobaxterm 这种图形化软件, 但是我们做技术的怎么屑于使用这种傻瓜式的方法呢! 我们要做的当然是在命令行中直接登录. 

默认情况下, 在命令行登录有几个麻烦的地方:

- 要输入 ip (不过, 你可能通过 alias 简化操作)
- 要输入密码(可以通过密钥的方法, 添加的 ssh-agent 中)

其实, 最简单的方法就是通过 ssh 自身的配置文件. 新建 `~/.ssh/config` 文件. 比如你实验室的服务器 ip 为 172.18.32.14, 你用户名为 your_id, 你配置了密钥, 你的私钥为 your_private_key_file, 这时, 你就可以在`~/.ssh/config` 输入如下内容

```shell
Host lab
	HostName 172.18.32.14
	User your_id
	IdentityFile path_to_your_private_key_file
```

这样, 你就可能在命令行中通过 `ssh lab` 即可, 这里的 lab 只是一个便于记忆的名称而已, 可以随便更改. 上面的选项, 你也可以根据需要省略其中若干项. 比如, 如果出于安全考虑, 不想使用密钥, 那么你就不用写 `Identity` 这一项.

<hr>
 王礼萍  原创<br>
 更多内容请访问 https://wanglp.site <br>

