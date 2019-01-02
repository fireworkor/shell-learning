#!/bin/bash

function task1(){
		read -t 30 -p "请输入oracle的dpdump目录:" myPath
		read -t 30 -p "请输入要操作的用户: " createUser
		read -t 30 -p "请输入oracle的dpf目录: " oracleDbf
		read -t 30 -p "请输入oracle的sys用户密码: " sysPassword
}

function task2(){
	clear
	echo "进入创建角色模块"
	echo "创建角色"
	echo '--创建角色' >createRole.sql
	echo 'CREATE ROLE lis_select_lis_role;' >>createRole.sql
	echo '--GRANT SELECT ON CLASS TO lis_select_lis_role;' >>createRole.sql
	echo 'commit;' >>createRole.sql
	echo 'exit' >>createRole.sql
	sqlplus sys/${sysPassword}@helowin as sysdba @createRole.sql
}

function task3(){
	clear
	echo "进入创建表空间模块"
	echo '--1、创建表空间' >createUser.sql
	echo "CREATE TABLESPACE ${createUser}" >>createUser.sql
	echo "DATAFILE '${oracleDbf}/${createUser}.dbf'" >>createUser.sql
	echo 'SIZE 50M' >>createUser.sql
	echo 'AUTOEXTEND ON;' >>createUser.sql
	echo 'commit;' >>createUser.sql

	echo "--2、创建用户" >>createUser.sql
	echo "CREATE USER ${createUser}"  >>createUser.sql
	echo "IDENTIFIED BY ${createUser}" >>createUser.sql
	echo "DEFAULT TABLESPACE ${createUser}" >>createUser.sql
	echo "TEMPORARY TABLESPACE temp ;" >>createUser.sql
	echo "--DROP USER ${createUser} CASCADE;" >>createUser.sql
	
	echo '--3、给自己的用户赋予权限来管理自己的表空间' >>createUser.sql
	echo "--REVOKE DBA FROM ${createUser};" >>createUser.sql
	echo "GRANT CONNECT,RESOURCE,DBA,lis_select_lis_role TO ${createUser};" >>createUser.sql
	echo 'commit;' >>createUser.sql
	echo 'exit' >>createUser.sql
	sqlplus sys/${sysPassword}@helowin as sysdba @createUser.sql
}

function task4(){
	clear
	echo "进入导入dmp模块"
	num=3
	until [ $num == 0 ]
	do
		echo "***********************************************************************"	
		ls | cat -n 
		echo "***********************************************************************"
		read -t 30 -p "请输入你导入的文件的行号，退出请按0: " num
		if [ ! $num == 0 ]
		then
			dmpFileName=$(ls | sed -n "$num"p)
			clear
			echo 导入dmp文件
			impdp ${createUser}/${createUser}@helowin REMAP_SCHEMA=lis:${createUser}  REMAP_TABLESPACE=lis_tbs:${createUser}  DIRECTORY=DATA_PUMP_DIR  DUMPFILE=${dmpFileName}  logfile=db.log full=y
		else	
			echo "退出导入模块"
		fi
	done
}

function task5(){
	clear
	echo "进入删除用户模块"
	echo "--删除用户和对象" >deleteUser.sql
	echo "drop user  ${createUser} cascade;" >>deleteUser.sql
	echo "--删除表空间,数据和完整性约束" >>deleteUser.sql
	echo "drop tablespace ${createUser} including contents cascade constraints;" >>deleteUser.sql
	echo "commit;" >>deleteUser.sql
	echo "exit" >>deleteUser.sql
	sqlplus sys/${sysPassword}@helowin as sysdba @deleteUser.sql
}

function task6(){
	rm -rf `pwd`/createRole.sql
	rm -rf `pwd`/createUser.sql
	rm -rf `pwd`/deleteUser.sql
}

function mainMenu(){
while true
do
	echo	==================================
	echo                  '菜单选项'
	echo           '请输入1:设置变量'
	echo           '请输入2:创建角色'
	echo           '请输入3:创建用户,表空间'
	echo           '请输入4:导入dmp文件	'
	echo           '请输入5:删除用户,表空间'
	echo           '请输入6:退出'			
	echo	==================================
	read -t 30 -p "please input your choise:" cho 
	case "$cho" in
			"1")
					clear
					task1
					;;  
			"2")
					clear
					task2
					;;  
			"3")
					clear
					task3
					;;  
			"4")
					clear
					task4
					;;  
			"5")
					clear
					task5
					;;
			"6")	clear
					task6
					exit
					;;
			"*") 	echo "输入错误,请重新输入"
					;;
	esac
done
}
#默认的参数配置
#oracle的dpdump目录,操作的用户,oracle的dpf目录,oracle的sys用户密码
myPath='/home/oracle/tools'
createUser='test'
oracleDbf='/home/oracle/app/oracle/oradata/helowin'
sysPassword='sys'
mainMenu

