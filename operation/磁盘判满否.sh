#!/bin/bash
#判断根分区是否已经占满

rate=$(df -h |grep /sda2 | awk '{print $5} '| cut -d "%" -f1)
if [ $rate -ge 80 ]
	then
		echo "磁盘快满了，赶快清理"
	fi
