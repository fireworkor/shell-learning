#!/bin/bash
#
#********************************************************************
#Author:            fireworkor
#QQ:                3159553637
#Date:              2021-05-08
#FileName:          npc-client.sh
#URL:               https://github.com/fireworkor/shell-learning
#Description:       判断npc是否启动的脚本
#Copyright (C):     2021 All rights reserved
#********************************************************************

cd $(dirname $0)
pid=$(pgrep npc)
if [ -z "$pid" ]; then
    nohup ./npc -config ./conf/npc.conf >/dev/null 2>&1 &
fi