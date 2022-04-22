#!/bin/bash
#窗口查看器v1.0

while true
do
        clear
        echo "***********************************************************************"
                screen -list|sed '1d'|sed '$d'|sed '$d' | cat -n
        echo "***********************************************************************"
        read -t 30 -p "请输入你要查看的窗口的行号，退出请按q: " lineNum
        if [ $lineNum == 'q' ];then
                break
        fi
        screenName=$(screen -list|sed '1d'|sed '$d'|sed '$d' | cat -n | sed -n "$lineNum"p|cut  -f 3)
        if [[ $screenName == *"."* ]];then
                screen -R  $screenName
        fi
done
