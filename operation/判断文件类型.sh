#!/bin/bash
#判断文件类型,是否可读可写可执行
read -t 30 -p "please input fil name: " fil 
if [ -e $fil ]
	then
		echo "这个文件存在"	
		if [ -d $fil ]
			then
				echo "这是目录"
		elif [ -f $fil ]
			then
				echo "这是常规文件"
		elif [ -l $fil ]
			then
				echo "这是链接文件"
		fi
		if [ -r $fil ]
					then
						echo "这个文件可读"
		fi
		if [ -w $fil ]
					then
						echo "这个文件可写"
		fi
		if [ -x $fil ]
					then
						echo "这个文件可执行"
		fi
		
	else	
		echo "这个文件不存在"
fi
