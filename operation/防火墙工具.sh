#!/bin/bash
#防火墙工具V1.0
while true
do
	echo	==================================
	echo                  '菜单选项'
	echo           '1.查看防火墙状态'
	echo           '2.重启防火墙'
	echo           '3.开启防火墙(单次)'
	echo           '4.关闭防火墙(单次)'
	echo           '5.开启防火墙(永久)'
	echo           '6.关闭防火墙(永久)'
	echo           '7.exit'
	echo	==================================
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
        	"1")
					clear
					service iptables status
					#/etc/init.d/iptables status 
                	;;  
       		 "2")
                	clear
					service  iptables  restart
               		;;  
       		 "3")
					clear
					service iptables start
					#/etc/init.d/iptables start 
            		;;  
       		 "4")
               		clear
					service iptables stop
					#/etc/init.d/iptables stop 
               		;;  
       		 "5")
               		#开机启动
					clear
					chkconfig  iptables  on

                	;;
			"6")	
					#关闭防火墙开机启动（永久关闭）
					clear
					chkconfig iptables off
					;;
			"7")	
					exit
					;;
			"*") 	echo "cuowu"
					;;
	esac
done