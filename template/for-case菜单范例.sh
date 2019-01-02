#!/bin/bash
while true
do
	echo	==================================
	echo                  '菜单选项'
	echo           'please input num 1'
	echo           'please input num 2'
	echo           'please input num 3'
	echo           'please input num 4'
	echo           'please input num 5'
	echo           'exit'
	echo	==================================
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
        	"1")
                	clear
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
					exit
					;;
			"*") 	echo "cuowu"
					;;
	esac
done
