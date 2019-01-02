#!/bin/bash

# 从文件中获取要迭代的节点
SERVERS=`cat /root/slaves`


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
# 循环各节点 拷贝脚本  并调用执行
for SERVER in $SERVERS
do
    echo "#######begin scp file to $SERVER #######################"
    echo "##############################"
    scp /root/tomcat_install.sh root@$SERVER:/root
    echo "#######begin ssh shell @ $SERVER #######################"
    echo "##############################"
    # 传递两个参数  一个是节点名称  一个是主机名，即apache server所在的机器名称
    ssh root@$SERVER /bin/bash /root/tomcat_install.sh $SERVER $HOSTNAME
done