@ECHO OFF&PUSHD %~DP0 &TITLE ����mongodb
mode con cols=42 lines=22
color 2F
:Menu
Cls
@ echo.
@ echo.������������   �� �� ѡ ��
@ echo.     
@ echo.       ����mongodb������ �� ������1           
@ echo.     
@ echo.       ����mongodb�ͻ��� �� ������2           
@ echo.                  
@ echo.       �˳�              �� ������3               
@ echo.      
set /p xj= �������ְ��س���
if /i "%xj%"=="1" Goto mongodbservice
if /i "%xj%"=="2" Goto mongodb
if /i "%xj%"=="3" Goto exit
@ echo.

:mongodbservice
:: ����mongodb������
start cmd /k "mongod --config D:\study\databases\mongodb\bin\mongo_config.txt"
cmdow ����mongodb /top 
goto menu

: mongodb
:: ����mongodb�ͻ���
start cmd /k "mongo.exe"

