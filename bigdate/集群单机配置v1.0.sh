#!/bin/bash
#集群配置V1.0
while true
do
	echo	==================================
	echo                  '菜单选项'
	echo           '1.配置主机名'
	echo           '2.配置映射关系，添加别名'
	echo           '3.配置ip地址'
	echo           '4.关闭防火墙'
	echo           '5.解决MAC冲突'
	echo           '6.一键执行集群单机配置'
	echo           '7.exit'
	echo	==================================
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
        	"1")
                	vi /etc/sysconfig/network
                	;;  
       		 "2")
                	vi /etc/hosts
               		;;  
       		 "3")
                	vi /etc/sysconfig/network-scripts/ifcfg-eth0
            		;;  
       		 "4")
               		chkconfig iptables off
               		;;  
       		 "5")
               		rm –rf  /etc/udev/rules.d/70-persistent-net.rules
                	;;
			"6")	
					vi /etc/hosts
					vi /etc/sysconfig/network
					vi /etc/sysconfig/network-scripts/ifcfg-eth0
					rm –rf  /etc/udev/rules.d/70-persistent-net.rules
					service network restart
					chkconfig iptables off
					;;
			"7")	
					exit
					;;
			"*") 	echo "cuowu"
					;;
	esac
done