#!/bin/bash


read -t 30 -p "please input your username:" name

if [ "$name" == root  ];then
	echo "welcome super man,"$name

elif [ "$name" == angelababy  ];then
	echo "my love ,"$name

elif [ "$name" == hxm ];then
	echo "get out here "$name

else 
	echo "valid user"$name
fi
