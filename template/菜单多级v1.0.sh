#!/bin/bash
#菜单v1.0
menu1(){
	echo	==================================
	echo                  '菜单选项'
	echo           'please input num 1'
	echo           'please input num 2'
	echo           'please input num 3'
	echo           'please input num 4'
	echo           'please input num 5'
	echo           'exit'
	echo	==================================
}
menu1.1(){
	echo                  '二级菜单'
	echo           'please input num 1'
	echo           'please input num 2'
	echo           'please input num 3'
	echo           'please input num 4'
	echo           'please input num 5'
	echo           'exit'
}
loop(){
while true
	do
	menu1.1
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
        	"1")
                	echo "xuanze1"
                	;;  
       		"2")
                	clear
					echo "xuanze2"
               		;;  
       		"3")
                	clear
					echo "xuanze3"
            		;;  
       		"4")
               		clear
					echo "xuanze4"
               		;;  
       		"5")
               		clear
					echo "xuanze5"
                	;;
			"6")		clear
					break
					;;
			"*") 	echo "cuowu"
					;;
	esac
done
}
while true
do
	menu1
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
        	"1")
                	clear
					loop
                	;;  
       		"2")
                	clear
					echo "xuanze2"
               		;;  
       		"3")
                	clear
					echo "xuanze3"
            		;;  
       		"4")
               		clear
					echo "xuanze4"
               		;;  
       		"5")
               		clear
					echo "xuanze5"
                	;;
			"6")		clear
					exit
					;;
			"*") 	echo "cuowu"
					;;
	esac
done
