@ECHO OFF&PUSHD %~DP0 &TITLE ����oracleTools
mode con cols=100 lines=100
color 2F

::����oracle��dmp����Ŀ¼ 
set myPath=D:\app\Administrator\admin\orcl\dpdump
set createUser=uat
set oracleDbf=D:\oracle_data
set sysPassword=root


:Menu
Cls
@ echo.
@ echo.������������   �� �� ѡ ��
@ echo.     
@ echo.     	 ������1:���ñ���
@ echo.     	 ������2:������ɫ				
@ echo.     	 ������3:�����û�,��ռ� 			
@ echo.     	 ������4:����dmp�ļ�		
@ echo.     	 ������5:ɾ���û�,��ռ�		 
@ echo.     	 ������6:�˳�					
@ echo.                                            
set /p xj= �������ְ��س���
if /i "%xj%"=="1" Goto setVar
if /i "%xj%"=="2" Goto createRole
if /i "%xj%"=="3" Goto createUser
if /i "%xj%"=="4" Goto importDMP
if /i "%xj%"=="5" Goto deleteUser
if /i "%xj%"=="6" Goto exitScript
@ echo.

::���ò������û�
:setVar
set /p createUser= ������������û���
set /p myPath= ������oracle��dpdumpĿ¼:
set /p oracleDbf= ������oracle��dpfĿ¼:
set /p sysPassword= ������oracle��sys�û�����:
goto menu

::������ɫ
:createRole
echo "������ɫ"
echo --������ɫ >createRole.sql
echo CREATE ROLE lis_select_lis_role; >>createRole.sql
echo GRANT SELECT ON CLASS TO lis_select_lis_role; >>createRole.sql
echo commit; >>createRole.sql
echo exit >>createRole.sql
sqlplus sys/%sysPassword%@orcl as sysdba @createRole.sql
pause
goto menu

::�����û�,��ռ�
:createUser
echo "�����û�"
echo --1��������ռ� >createUser.sql
echo CREATE TABLESPACE %createUser% >>createUser.sql
echo DATAFILE '%oracleDbf%\%createUser%.dbf' >>createUser.sql
echo SIZE 50M >>createUser.sql
echo AUTOEXTEND ON; >>createUser.sql
echo commit; >>createUser.sql
echo  
echo --2�������û� >>createUser.sql
echo CREATE USER %createUser%  >>createUser.sql
echo IDENTIFIED BY %createUser% >>createUser.sql
echo DEFAULT TABLESPACE %createUser% >>createUser.sql
echo TEMPORARY TABLESPACE temp ; >>createUser.sql
echo --DROP USER %createUser% CASCADE; >>createUser.sql
echo
echo --3�����Լ����û�����Ȩ���������Լ��ı�ռ� >>createUser.sql
echo --REVOKE DBA FROM %createUser%; >>createUser.sql
echo GRANT CONNECT,RESOURCE,DBA,lis_select_lis_role TO %createUser%; >>createUser.sql
echo commit; >>createUser.sql
echo exit >>createUser.sql
sqlplus sys/%sysPassword%@orcl as sysdba @createUser.sql
pause
goto menu


::����dmp�ļ�
:importDMP
::����ط��е�Сbug,������һȦ,�õ��˰�������������һ���ļ���
for /f %%A in ('dir /B /O:N %myPath%\*.dmp') do set "dmpFileName=%%A"
impdp %createUser%/%createUser%@orcl REMAP_SCHEMA=lis:%createUser%  REMAP_TABLESPACE=lis_tbs:%createUser%  DIRECTORY=DATA_PUMP_DIR  DUMPFILE=%dmpFileName%  logfile=db.log full=y
pause	
echo "����dmp�ļ�"
goto menu


::ɾ���û�,��ռ�
:deleteUser
echo "ɾ���û�,��ռ��dbf�ļ�"
echo --ɾ���û��Ͷ��� >deleteUser.sql
echo drop user  %createUser% cascade; >>deleteUser.sql
echo --ɾ����ռ�,���ݺ�������Լ�� >>deleteUser.sql
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