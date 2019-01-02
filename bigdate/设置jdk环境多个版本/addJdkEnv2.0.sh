#!/bin/bash

#判断java环境变量设置情况,如果找到就替换，没有找到就添加
ISNEED=`cat etc.profile.bak | grep ".*JAVA_HOME.*$"` 
if [ "$ISNEED" != "" ];then
	#将有关键字的行删除
	sed -i '/.*JAVA_HOME.*$/d' etc.profile.bak
fi
#将环境变量添加进去文件中
cat >> etc.profile.bak << flag

#JAVA_HOME环境变量
export JAVA_HOME=/usr/java
export PATH=\$PATH:\$JAVA_HOME/bin
flag
