#ssh免密登录
#	注意：免密码登录是单向的
#ssh免密登录原理：
#	1, node1 使用 ssh-keygen –t rsa 生成公钥和私钥
#	2，	ssh-copy-id root@node2 将公钥拷贝到node2上，实际上是把公钥内容追加到 authorized_keys文件中。
#	请求时：
#	1，node1向node2发送连接请求时，附带主机，ip地址等信息
#	3，	node2收到请求后，去授权文件里查找node1的公钥，找到之后，随机生成一个字符串，并用公钥加密，并发送给node1
#	4，	node1接收到密文之后，用私钥解密，并把解密结果返回给node2
#	node2拿到解密结果之后，与之前的字符串进行比较，如果相同，则可以登录成功。
ssh-keygen –t rsa

#将公钥传给从机
#ssh-copy-id root@node2 


#如何跨节点执行命令？？
#免密登陆后执行下面
#ssh root@hdp-02 mkdir mulu