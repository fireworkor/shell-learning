#!/bin/bash
#安装xorg-xbacklight
#控制屏幕亮度的方法

main(){
		while true
		do
			menu
			read param1
			clear
			if [ $param1 == '1' ]; then 
				read param2_1
				decScreenLight $param2_1	
			elif [ $param1 == '2' ]; then
				read param2_1
				incScreenLight $param2_1
			elif [ $param1 == '3' ]; then 
				read param2_1
				setScreenLight $param2_1
			else 
				exit
			fi
        done 

}
#控制屏幕亮度的菜单
menu(){
	echo '1.亮度减小输入值'
	echo '2.亮度增加输入值'
	echo '3.亮度设置百分值'
	echo '4.退出'
}
#控制屏幕亮度 0-100
setScreenLight(){
	xbacklight -set $1 
}
#屏幕亮度增加某个值
incScreenLight(){
	xbacklight -inc $1
}
#屏幕亮度减少某个值
decScreenLight(){
	xbacklight -dec $1
}
	
main
