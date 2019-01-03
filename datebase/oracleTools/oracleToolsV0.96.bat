@ECHO OFF&PUSHD %~DP0 &TITLE 启动oracleTools
mode con cols=100 lines=100
color 2F

::设置oracle的dmp导入目录 
set myPath=D:\app\Administrator\admin\orcl\dpdump
set createUser=uat
set oracleDbf=D:\oracle_data
set sysPassword=root


:Menu
Cls
@ echo.
@ echo.　　　　　　   菜 单 选 项
@ echo.     
@ echo.     	 请输入1:设置变量
@ echo.     	 请输入2:创建角色				
@ echo.     	 请输入3:创建用户,表空间 			
@ echo.     	 请输入4:导入dmp文件		
@ echo.     	 请输入5:删除用户,表空间		 
@ echo.     	 请输入6:退出					
@ echo.                                            
set /p xj= 输入数字按回车：
if /i "%xj%"=="1" Goto setVar
if /i "%xj%"=="2" Goto createRole
if /i "%xj%"=="3" Goto createUser
if /i "%xj%"=="4" Goto importDMP
if /i "%xj%"=="5" Goto deleteUser
if /i "%xj%"=="6" Goto exitScript
@ echo.

::设置操作的用户
:setVar
set /p createUser= 请输入操作的用户：
set /p myPath= 请输入oracle的dpdump目录:
set /p oracleDbf= 请输入oracle的dpf目录:
set /p sysPassword= 请输入oracle的sys用户密码:
goto menu

::创建角色
:createRole
echo "创建角色"
echo --创建角色 >createRole.sql
echo CREATE ROLE lis_select_lis_role; >>createRole.sql
echo GRANT SELECT ON CLASS TO lis_select_lis_role; >>createRole.sql
echo commit; >>createRole.sql
echo exit >>createRole.sql
sqlplus sys/%sysPassword%@orcl as sysdba @createRole.sql
pause
goto menu

::创建用户,表空间
:createUser
echo "创建用户"
echo --1、创建表空间 >createUser.sql
echo CREATE TABLESPACE %createUser% >>createUser.sql
echo DATAFILE '%oracleDbf%\%createUser%.dbf' >>createUser.sql
echo SIZE 50M >>createUser.sql
echo AUTOEXTEND ON; >>createUser.sql
echo commit; >>createUser.sql
echo  
echo --2、创建用户 >>createUser.sql
echo CREATE USER %createUser%  >>createUser.sql
echo IDENTIFIED BY %createUser% >>createUser.sql
echo DEFAULT TABLESPACE %createUser% >>createUser.sql
echo TEMPORARY TABLESPACE temp ; >>createUser.sql
echo --DROP USER %createUser% CASCADE; >>createUser.sql
echo
echo --3、给自己的用户赋予权限来管理自己的表空间 >>createUser.sql
echo --REVOKE DBA FROM %createUser%; >>createUser.sql
echo GRANT CONNECT,RESOURCE,DBA,lis_select_lis_role TO %createUser%; >>createUser.sql
echo commit; >>createUser.sql
echo exit >>createUser.sql
sqlplus sys/%sysPassword%@orcl as sysdba @createUser.sql
pause
goto menu


::导入dmp文件
:importDMP
::这个地方有点小bug,多走了一圈,拿到了按名称排序的最后一个文件名
for /f %%A in ('dir /B /O:N %myPath%\*.dmp') do set "dmpFileName=%%A"
impdp %createUser%/%createUser%@orcl REMAP_SCHEMA=lis:%createUser%  REMAP_TABLESPACE=lis_tbs:%createUser%  DIRECTORY=DATA_PUMP_DIR  DUMPFILE=%dmpFileName%  logfile=db.log full=y
pause	
echo "导入dmp文件"
goto menu


::删除用户,表空间
:deleteUser
echo "删除用户,表空间和dbf文件"
echo --删除用户和对象 >deleteUser.sql
echo drop user  %createUser% cascade; >>deleteUser.sql
echo --删除表空间,数据和完整性约束 >>deleteUser.sql
echo drop tablespace %createUser% including contents cascade constraints; >>deleteUser.sql
echo commit; >>deleteUser.sql
echo exit >>deleteUser.sql
sqlplus sys/%sysPassword%@orcl as sysdba @deleteUser.sql
del /q %oracleDbf%\%createUser%.dbf
pause
goto menu

:exitScript
del /q createRole.sql
del /q createUser.sql
del /q deleteUser.sql
exit