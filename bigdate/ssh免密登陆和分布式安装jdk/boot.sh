#!/bin/bash

if [ $# -lt 1 ];then
echo "please Usage:passwd"
exit 1
fi

# 从文件中获取要迭代的节点
SERVERS=`cat /root/slaves`
# 获取个节点的密码，进行免密登陆配置，可直接从参数中获取
PASSWORD=$1

ISNEED=`yum list installed | grep expect` 

# 判断一下是否需要安装expect命令
if [ "$ISNEED" == "" ];then

	yum -y install expect
############# install expect successed ##############
fi

# 配置免密登陆到各节点，需要传参数 节点名  密码
auto_ssh_copy_id() {
    expect -c "set timeout -1;
        spawn ssh-copy-id $1;
        expect {
            *(yes/no)* {send -- yes\r;exp_continue;}
            *password:* {send -- $2\r;exp_continue;}
        }";
}

# 本机生成公钥和私钥
auto_ssh-keygen() {
rm -rf /root/.ssh
expect -c "  
spawn ssh-keygen -t rsa  
    expect {  
        \"*key*\" {send \"\r\"; exp_continue}     
        \"*passphrase*\" {send \"\r\"; exp_continue}     
        \"*again*\" {send \"\r\";}     
    }  
"  

}

# 免密登陆主逻辑 函数
ssh_copy_id_to_all() {

    # 在当前节点生成一对钥匙
    auto_ssh-keygen
    # 循环集群节点，把公钥复制到其他节点
    for SERVER in $SERVERS
    do
        auto_ssh_copy_id $SERVER $PASSWORD
    done
}

ssh_copy_id_to_all

# 检测 httpd是否安装并启动
ISINSTALL=`yum list installed | grep httpd`
if [ "$ISINSTALL" == "" ];then
	yum - y install httpd
	service httpd start
else
	status=`service httpd status`
	if [ "$status" == "httpd is stopped" ];then
		service http start
	fi
fi

# 循环脚本之前 把jdk
/bin/cp /root/jdk-8u141-linux-x64.tar.gz /var/www/html/

# 循环各节点 拷贝脚本  并调用执行
for SERVER in $SERVERS
do
    echo "#######begin scp file to $SERVER #######################"
    echo "##############################"
    scp /root/install_everyone.sh root@$SERVER:/root
    echo "#######begin ssh shell @ $SERVER #######################"
    echo "##############################"
    # 传递两个参数  一个是节点名称  一个是主机名，即apache server所在的机器名称
    ssh root@$SERVER /bin/bash /root/install_everyone.sh $SERVER $HOSTNAME
done
