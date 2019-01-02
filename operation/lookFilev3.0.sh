#!/bin/bash
#文件查看器v3.0
#存在bug链接文件会使脚本失效

while true
do
	clear
	echo "***********************************************************************"  
		echo "     0  返回上层"
	        ls -F | cat -n
	echo "***********************************************************************"
	read -t 30 -p "请输入你要查看的文件的行号，退出请按q: " lineNum
	if [ $lineNum == 'q' ];then
		break
	fi
	fileName=$(ls | sed -n "$lineNum"p)
	if [ 0 == $fileName ];then 
		cd ..
		continue
	elif [ -L $fileName ] ;then
		ls -l $fileName
		continue
	elif [ -d $fileName ] ;then
		cd $fileName
		continue
	elif [ -f $fileName ];then 
		clear
	 	cat  $fileName
		read -n 1
	fi
done
