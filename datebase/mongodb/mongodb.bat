@ECHO OFF&PUSHD %~DP0 &TITLE 启动mongodb
mode con cols=42 lines=22
color 2F
:Menu
Cls
@ echo.
@ echo.　　　　　　   菜 单 选 项
@ echo.     
@ echo.       启动mongodb服务器 → 请输入1           
@ echo.     
@ echo.       启动mongodb客户端 → 请输入2           
@ echo.                  
@ echo.       退出              → 请输入3               
@ echo.      
set /p xj= 输入数字按回车：
if /i "%xj%"=="1" Goto mongodbservice
if /i "%xj%"=="2" Goto mongodb
if /i "%xj%"=="3" Goto exit
@ echo.

:mongodbservice
:: 启动mongodb服务器
start cmd /k "mongod --config D:\study\databases\mongodb\bin\mongo_config.txt"
cmdow 启动mongodb /top 
goto menu

: mongodb
:: 启动mongodb客户端
start cmd /k "mongo.exe"

