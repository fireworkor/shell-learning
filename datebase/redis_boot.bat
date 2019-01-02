@ECHO OFF&PUSHD %~DP0 &TITLE 启动redis
mode con cols=42 lines=22
color 2F
:Menu
Cls
@ echo.
@ echo.　　　　　　   菜 单 选 项
@ echo.     
@ echo.       启动redis服务器 → 请输入1           
@ echo.     
@ echo.       启动redis客户端 → 请输入2           
@ echo.                  
@ echo.       退出              → 请输入3               
@ echo.      
set /p xj= 输入数字按回车：
if /i "%xj%"=="1" Goto redisservice
if /i "%xj%"=="2" Goto redis
if /i "%xj%"=="3" Goto exit
@ echo.

:redisservice
:: 启动redis服务器
start cmd /k "redis-server.exe D:\study\databases\Redis-x64-3.2.100\redis.windows.conf"
::cmdow 启动redis /top 
goto menu

: redis
:: 启动redis客户端
start cmd /k "redis-cli.exe -h 127.0.0.1 -p 6379 -a 123456"

