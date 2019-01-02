#!/bin/bash

# 通过参数获取apache server所在的主机名
BASE_SERVER=$2
# 安装wget命令
ISNEED=`yum list installed | grep wget`
if [ "$ISNEED" == "" ];then
	yum install -y wget
fi
echo "########### install wget successed $1 ########################"

# 下载jdk安装包
wget $BASE_SERVER/apache-tomcat-7.0.79.tar.gz
# 解压之前 先清空目录
if [ -d /usr/local/apache-tomcat-7.0.79 ];then
	rm -rf /usr/local/apache-tomcat-7.0.79
fi	
# 解压安装包
tar -zxvf apache-tomcat-7.0.79.tar.gz -C /usr/local
echo "########### tar to  /usr/local successed @ $1 ########################"
# 清空软链接目录，重新创建软链接
rm -rf /usr/tomcat
ln -s /usr/local/apache-tomcat-7.0.79 /usr/tomcat
# 配置/etc/profile文件
cat >> /etc/profile << EOF
#tomcat 环境配置
export TOMCAT_HOME=/usr/tomcat
export PATH=\$PATH:\$TOMCAT_HOME/bin
EOF
echo "########### update /etc/profice @$1 successed ####################"

# source 配置文件
source /etc/profile
