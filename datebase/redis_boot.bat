@ECHO OFF&PUSHD %~DP0 &TITLE ����redis
mode con cols=42 lines=22
color 2F
:Menu
Cls
@ echo.
@ echo.������������   �� �� ѡ ��
@ echo.     
@ echo.       ����redis������ �� ������1           
@ echo.     
@ echo.       ����redis�ͻ��� �� ������2           
@ echo.                  
@ echo.       �˳�              �� ������3               
@ echo.      
set /p xj= �������ְ��س���
if /i "%xj%"=="1" Goto redisservice
if /i "%xj%"=="2" Goto redis
if /i "%xj%"=="3" Goto exit
@ echo.

:redisservice
:: ����redis������
start cmd /k "redis-server.exe D:\study\databases\Redis-x64-3.2.100\redis.windows.conf"
::cmdow ����redis /top 
goto menu

: redis
:: ����redis�ͻ���
start cmd /k "redis-cli.exe -h 127.0.0.1 -p 6379 -a 123456"

