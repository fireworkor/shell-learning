#!/bin/bash

#curl -sSO https://raw.githubusercontent.com/fireworkor/shell-learning/master/template/menu.sh && chmod +x menu.sh && ./menu.sh
#wget https://raw.githubusercontent.com/fireworkor/shell-learning/master/template/menu.sh && chmod +x menu.sh && ./menu.sh

setLanguage(){
  #js whiptail --title "Success" --msgbox "c" 10 60
  if [ `export|grep 'LC_ALL'|wc -l` = 0 ];then
      if [ `grep "LC_ALL" /etc/profile|wc -l` = 0 ];then
          echo "export LC_ALL='en_US.UTF-8'" >> /etc/profile
      fi
  fi
  if [ `grep "alias ll" /etc/profile|wc -l` = 0 ];then
      echo "alias ll='ls -alh'" >> /etc/profile
      echo "alias sn='snapraid'" >> /etc/profile
  fi
  source /etc/profile
}

#先设置语言
setLanguage
L="zh_cn"

# 主菜单函数
main_menu(){
  while true ; do
      clear
      if [ $L = "en" ];then
          OPTION=$(whiptail --title " SteamOS Tools  Version : 2.4.0 " --menu "
      Github: https://github.com/ivanhao/SteamOS Tools
      Please choose:" 20 60 10 \
          "1" "menu 1 desc" \
          "2" "menu 2 desc" \
          "3" "menu 3 desc" \
          "4" "menu 4 desc" \
          "5" "menu 5 desc" \
          "6" "menu 6 desc" \
          "7" "menu 7 desc" \
          "8" "menu 8 desc" \
          "9" "Change Language." \
          "0" "exit." \
          3>&1 1>&2 2>&3)
      else
          OPTION=$(whiptail --title " SteamOS Tools  Version : 2.4.0 " --menu "
      Github: https://github.com/ivanhao/SteamOS Tools
      请选择相应的配置：" 20 60 10 \
          "1" "菜单 1 描述" \
          "2" "菜单 2 描述" \
          "3" "菜单 3 描述" \
          "4" "菜单 4 描述" \
          "5" "菜单 5 描述" \
          "6" "菜单 6 描述" \
          "7" "菜单 7 描述" \
          "8" "菜单 8 描述" \
          "9" "Change Language" \
          "0" "exit. " \
          3>&1 1>&2 2>&3)
      fi
      case "$OPTION" in
      1 )
          function1
          ;;
      2 )
          function2
          ;;
      3 )
          function3
          ;;
      4 )
          function4
          ;;
      5 )
          function5
          ;;
      6 )
          function6
          ;;
      7 )
          function7
          ;;
      8 )
          function8
          ;;
      9 )
          function9
          ;;
      0 | exit | quit | q)
          break
          ;;
      *)
        whiptail --msgbox "无效的选择，请重新选择。"
        ;;
      esac
  done
  exit
}

function1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 1 Option 1 desc" \
                "2" "Function 1 Option 2 desc" \
                "3" "Function 1 Option 3 desc" \
                "4" "Function 1 Option 4 desc" \
                "5" "Function 1 Option 5 desc" \
                "6" "Function 1 Option 6 desc" \
                "7" "Function 1 Option 7 desc" \
                "8" "Function 1 Option 8 desc" \
                "9" "Function 1 Option 9 desc" \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 1 选项 1 描述" \
                "2" "功能 1 选项 2 描述" \
                "3" "功能 1 选项 3 描述" \
                "4" "功能 1 选项 4 描述" \
                "5" "功能 1 选项 5 描述" \
                "6" "功能 1 选项 6 描述" \
                "7" "功能 1 选项 7 描述" \
                "8" "功能 1 选项 8 描述" \
                "9" "功能 1 选项 9 描述" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function1_1
            ;;
        2 )
            function1_2
            ;;
        3 )
            function1_3
            ;;
        4 )
            function1_4
            ;;
        5 )
            function1_5
            ;;
        6 )
            function1_6
            ;;
        7 )
            function1_7
            ;;
        8 )
            function1_8
            ;;
        9 )
            function1_9
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function1_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 1_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 1_1 Option 1 desc" \
                "2" "Function 1_1 Option 2 desc" \
                "3" "Function 1_1 Option 3 desc" \
                "4" "Function 1_1 Option 4 desc" \
                "5" "Function 1_1 Option 5 desc" \
                "6" "Function 1_1 Option 6 desc" \
                "7" "Function 1_1 Option 7 desc" \
                "8" "Function 1_1 Option 8 desc" \
                "9" "Return to Function 1 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 1_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 1_1 选项 1 描述" \
                "2" "功能 1_1 选项 2 描述" \
                "3" "功能 1_1 选项 3 描述" \
                "4" "功能 1_1 选项 4 描述" \
                "5" "功能 1_1 选项 5 描述" \
                "6" "功能 1_1 选项 6 描述" \
                "7" "功能 1_1 选项 7 描述" \
                "8" "功能 1_1 选项 8 描述" \
                "9" "返回功能 1 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function1_1_1
            ;;
        2 )
            function1_1_2
            ;;
        3 )
            function1_1_3
            ;;
        4 )
            function1_1_4
            ;;
        5 )
            function1_1_5
            ;;
        6 )
            function1_1_6
            ;;
        7 )
            function1_1_7
            ;;
        8 )
            function1_1_8
            ;;
        9 )
            function1
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function1_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_1 executed."
    else
        whiptail --msgbox "功能 1_1_1 已执行。"
    fi
}

function1_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_2 executed."
    else
        whiptail --msgbox "功能 1_1_2 已执行。"
    fi
}

function1_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_3 executed."
    else
        whiptail --msgbox "功能 1_1_3 已执行。"
    fi
}

function1_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_4 executed."
    else
        whiptail --msgbox "功能 1_1_4 已执行。"
    fi
}

function1_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_5 executed."
    else
        whiptail --msgbox "功能 1_1_5 已执行。"
    fi
}

function1_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_6 executed."
    else
        whiptail --msgbox "功能 1_1_6 已执行。"
    fi
}

function1_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_7 executed."
    else
        whiptail --msgbox "功能 1_1_7 已执行。"
    fi
}

function1_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_1_8 executed."
    else
        whiptail --msgbox "功能 1_1_8 已执行。"
    fi
}

function1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_2 executed."
    else
        whiptail --msgbox "功能 1_2 已执行。"
    fi
}

function1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_3 executed."
    else
        whiptail --msgbox "功能 1_3 已执行。"
    fi
}

function1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_4 executed."
    else
        whiptail --msgbox "功能 1_4 已执行。"
    fi
}

function1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_5 executed."
    else
        whiptail --msgbox "功能 1_5 已执行。"
    fi
}

function1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_6 executed."
    else
        whiptail --msgbox "功能 1_6 已执行。"
    fi
}

function1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_7 executed."
    else
        whiptail --msgbox "功能 1_7 已执行。"
    fi
}

function1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_8 executed."
    else
        whiptail --msgbox "功能 1_8 已执行。"
    fi
}
function1_9() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 1_9 executed."
    else
        whiptail --msgbox "功能 1_9 已执行。"
    fi
}

function2() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 2 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 2 Option 1 desc" \
                "2" "Function 2 Option 2 desc" \
                "3" "Function 2 Option 3 desc" \
                "4" "Function 2 Option 4 desc" \
                "5" "Function 2 Option 5 desc" \
                "6" "Function 2 Option 6 desc" \
                "7" "Function 2 Option 7 desc" \
                "8" "Function 2 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 2 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 2 选项 1 描述" \
                "2" "功能 2 选项 2 描述" \
                "3" "功能 2 选项 3 描述" \
                "4" "功能 2 选项 4 描述" \
                "5" "功能 2 选项 5 描述" \
                "6" "功能 2 选项 6 描述" \
                "7" "功能 2 选项 7 描述" \
                "8" "功能 2 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function2_1
            ;;
        2 )
            function2_2
            ;;
        3 )
            function2_3
            ;;
        4 )
            function2_4
            ;;
        5 )
            function2_5
            ;;
        6 )
            function2_6
            ;;
        7 )
            function2_7
            ;;
        8 )
            function2_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function2_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 2_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 2_1 Option 1 desc" \
                "2" "Function 2_1 Option 2 desc" \
                "3" "Function 2_1 Option 3 desc" \
                "4" "Function 2_1 Option 4 desc" \
                "5" "Function 2_1 Option 5 desc" \
                "6" "Function 2_1 Option 6 desc" \
                "7" "Function 2_1 Option 7 desc" \
                "8" "Function 2_1 Option 8 desc" \
                "9" "Return to Function 2 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 2_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 2_1 选项 1 描述" \
                "2" "功能 2_1 选项 2 描述" \
                "3" "功能 2_1 选项 3 描述" \
                "4" "功能 2_1 选项 4 描述" \
                "5" "功能 2_1 选项 5 描述" \
                "6" "功能 2_1 选项 6 描述" \
                "7" "功能 2_1 选项 7 描述" \
                "8" "功能 2_1 选项 8 描述" \
                "9" "返回功能 2 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function2_1_1
            ;;
        2 )
            function2_1_2
            ;;
        3 )
            function2_1_3
            ;;
        4 )
            function2_1_4
            ;;
        5 )
            function2_1_5
            ;;
        6 )
            function2_1_6
            ;;
        7 )
            function2_1_7
            ;;
        8 )
            function2_1_8
            ;;
        9 )
            function2
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function2_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_1 executed."
    else
        whiptail --msgbox "功能 2_1_1 已执行。"
    fi
}

function2_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_2 executed."
    else
        whiptail --msgbox "功能 2_1_2 已执行。"
    fi
}

function2_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_3 executed."
    else
        whiptail --msgbox "功能 2_1_3 已执行。"
    fi
}

function2_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_4 executed."
    else
        whiptail --msgbox "功能 2_1_4 已执行。"
    fi
}

function2_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_5 executed."
    else
        whiptail --msgbox "功能 2_1_5 已执行。"
    fi
}

function2_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_6 executed."
    else
        whiptail --msgbox "功能 2_1_6 已执行。"
    fi
}

function2_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_7 executed."
    else
        whiptail --msgbox "功能 2_1_7 已执行。"
    fi
}

function2_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_1_8 executed."
    else
        whiptail --msgbox "功能 2_1_8 已执行。"
    fi
}

function2_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_2 executed."
    else
        whiptail --msgbox "功能 2_2 已执行。"
    fi
}

function2_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_3 executed."
    else
        whiptail --msgbox "功能 2_3 已执行。"
    fi
}

function2_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_4 executed."
    else
        whiptail --msgbox "功能 2_4 已执行。"
    fi
}

function2_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_5 executed."
    else
        whiptail --msgbox "功能 2_5 已执行。"
    fi
}

function2_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_6 executed."
    else
        whiptail --msgbox "功能 2_6 已执行。"
    fi
}

function2_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_7 executed."
    else
        whiptail --msgbox "功能 2_7 已执行。"
    fi
}

function2_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 2_8 executed."
    else
        whiptail --msgbox "功能 2_8 已执行。"
    fi
}

function3() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 3 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 3 Option 1 desc" \
                "2" "Function 3 Option 2 desc" \
                "3" "Function 3 Option 3 desc" \
                "4" "Function 3 Option 4 desc" \
                "5" "Function 3 Option 5 desc" \
                "6" "Function 3 Option 6 desc" \
                "7" "Function 3 Option 7 desc" \
                "8" "Function 3 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 3 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 3 选项 1 描述" \
                "2" "功能 3 选项 2 描述" \
                "3" "功能 3 选项 3 描述" \
                "4" "功能 3 选项 4 描述" \
                "5" "功能 3 选项 5 描述" \
                "6" "功能 3 选项 6 描述" \
                "7" "功能 3 选项 7 描述" \
                "8" "功能 3 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function3_1
            ;;
        2 )
            function3_2
            ;;
        3 )
            function3_3
            ;;
        4 )
            function3_4
            ;;
        5 )
            function3_5
            ;;
        6 )
            function3_6
            ;;
        7 )
            function3_7
            ;;
        8 )
            function3_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function3_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 3_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 3_1 Option 1 desc" \
                "2" "Function 3_1 Option 2 desc" \
                "3" "Function 3_1 Option 3 desc" \
                "4" "Function 3_1 Option 4 desc" \
                "5" "Function 3_1 Option 5 desc" \
                "6" "Function 3_1 Option 6 desc" \
                "7" "Function 3_1 Option 7 desc" \
                "8" "Function 3_1 Option 8 desc" \
                "9" "Return to Function 3 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 3_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 3_1 选项 1 描述" \
                "2" "功能 3_1 选项 2 描述" \
                "3" "功能 3_1 选项 3 描述" \
                "4" "功能 3_1 选项 4 描述" \
                "5" "功能 3_1 选项 5 描述" \
                "6" "功能 3_1 选项 6 描述" \
                "7" "功能 3_1 选项 7 描述" \
                "8" "功能 3_1 选项 8 描述" \
                "9" "返回功能 3 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function3_1_1
            ;;
        2 )
            function3_1_2
            ;;
        3 )
            function3_1_3
            ;;
        4 )
            function3_1_4
            ;;
        5 )
            function3_1_5
            ;;
        6 )
            function3_1_6
            ;;
        7 )
            function3_1_7
            ;;
        8 )
            function3_1_8
            ;;
        9 )
            function3
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function3_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_1 executed."
    else
        whiptail --msgbox "功能 3_1_1 已执行。"
    fi
}

function3_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_2 executed."
    else
        whiptail --msgbox "功能 3_1_2 已执行。"
    fi
}

function3_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_3 executed."
    else
        whiptail --msgbox "功能 3_1_3 已执行。"
    fi
}

function3_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_4 executed."
    else
        whiptail --msgbox "功能 3_1_4 已执行。"
    fi
}

function3_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_5 executed."
    else
        whiptail --msgbox "功能 3_1_5 已执行。"
    fi
}

function3_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_6 executed."
    else
        whiptail --msgbox "功能 3_1_6 已执行。"
    fi
}

function3_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_7 executed."
    else
        whiptail --msgbox "功能 3_1_7 已执行。"
    fi
}

function3_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_1_8 executed."
    else
        whiptail --msgbox "功能 3_1_8 已执行。"
    fi
}

function3_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_2 executed."
    else
        whiptail --msgbox "功能 3_2 已执行。"
    fi
}

function3_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_3 executed."
    else
        whiptail --msgbox "功能 3_3 已执行。"
    fi
}

function3_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_4 executed."
    else
        whiptail --msgbox "功能 3_4 已执行。"
    fi
}

function3_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_5 executed."
    else
        whiptail --msgbox "功能 3_5 已执行。"
    fi
}

function3_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_6 executed."
    else
        whiptail --msgbox "功能 3_6 已执行。"
    fi
}

function3_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_7 executed."
    else
        whiptail --msgbox "功能 3_7 已执行。"
    fi
}

function3_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 3_8 executed."
    else
        whiptail --msgbox "功能 3_8 已执行。"
    fi
}

function4() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 4 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 4 Option 1 desc" \
                "2" "Function 4 Option 2 desc" \
                "3" "Function 4 Option 3 desc" \
                "4" "Function 4 Option 4 desc" \
                "5" "Function 4 Option 5 desc" \
                "6" "Function 4 Option 6 desc" \
                "7" "Function 4 Option 7 desc" \
                "8" "Function 4 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 4 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 4 选项 1 描述" \
                "2" "功能 4 选项 2 描述" \
                "3" "功能 4 选项 3 描述" \
                "4" "功能 4 选项 4 描述" \
                "5" "功能 4 选项 5 描述" \
                "6" "功能 4 选项 6 描述" \
                "7" "功能 4 选项 7 描述" \
                "8" "功能 4 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function4_1
            ;;
        2 )
            function4_2
            ;;
        3 )
            function4_3
            ;;
        4 )
            function4_4
            ;;
        5 )
            function4_5
            ;;
        6 )
            function4_6
            ;;
        7 )
            function4_7
            ;;
        8 )
            function4_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function4_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 4_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 4_1 Option 1 desc" \
                "2" "Function 4_1 Option 2 desc" \
                "3" "Function 4_1 Option 3 desc" \
                "4" "Function 4_1 Option 4 desc" \
                "5" "Function 4_1 Option 5 desc" \
                "6" "Function 4_1 Option 6 desc" \
                "7" "Function 4_1 Option 7 desc" \
                "8" "Function 4_1 Option 8 desc" \
                "9" "Return to Function 4 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 4_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 4_1 选项 1 描述" \
                "2" "功能 4_1 选项 2 描述" \
                "3" "功能 4_1 选项 3 描述" \
                "4" "功能 4_1 选项 4 描述" \
                "5" "功能 4_1 选项 5 描述" \
                "6" "功能 4_1 选项 6 描述" \
                "7" "功能 4_1 选项 7 描述" \
                "8" "功能 4_1 选项 8 描述" \
                "9" "返回功能 4 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function4_1_1
            ;;
        2 )
            function4_1_2
            ;;
        3 )
            function4_1_3
            ;;
        4 )
            function4_1_4
            ;;
        5 )
            function4_1_5
            ;;
        6 )
            function4_1_6
            ;;
        7 )
            function4_1_7
            ;;
        8 )
            function4_1_8
            ;;
        9 )
            function4
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function4_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_1 executed."
    else
        whiptail --msgbox "功能 4_1_1 已执行。"
    fi
}

function4_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_2 executed."
    else
        whiptail --msgbox "功能 4_1_2 已执行。"
    fi
}

function4_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_3 executed."
    else
        whiptail --msgbox "功能 4_1_3 已执行。"
    fi
}

function4_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_4 executed."
    else
        whiptail --msgbox "功能 4_1_4 已执行。"
    fi
}

function4_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_5 executed."
    else
        whiptail --msgbox "功能 4_1_5 已执行。"
    fi
}

function4_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_6 executed."
    else
        whiptail --msgbox "功能 4_1_6 已执行。"
    fi
}

function4_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_7 executed."
    else
        whiptail --msgbox "功能 4_1_7 已执行。"
    fi
}

function4_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_1_8 executed."
    else
        whiptail --msgbox "功能 4_1_8 已执行。"
    fi
}

function4_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_2 executed."
    else
        whiptail --msgbox "功能 4_2 已执行。"
    fi
}

function4_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_3 executed."
    else
        whiptail --msgbox "功能 4_3 已执行。"
    fi
}

function4_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_4 executed."
    else
        whiptail --msgbox "功能 4_4 已执行。"
    fi
}

function4_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_5 executed."
    else
        whiptail --msgbox "功能 4_5 已执行。"
    fi
}

function4_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_6 executed."
    else
        whiptail --msgbox "功能 4_6 已执行。"
    fi
}

function4_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_7 executed."
    else
        whiptail --msgbox "功能 4_7 已执行。"
    fi
}

function4_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 4_8 executed."
    else
        whiptail --msgbox "功能 4_8 已执行。"
    fi
}

function5() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 5 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 5 Option 1 desc" \
                "2" "Function 5 Option 2 desc" \
                "3" "Function 5 Option 3 desc" \
                "4" "Function 5 Option 4 desc" \
                "5" "Function 5 Option 5 desc" \
                "6" "Function 5 Option 6 desc" \
                "7" "Function 5 Option 7 desc" \
                "8" "Function 5 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 5 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 5 选项 1 描述" \
                "2" "功能 5 选项 2 描述" \
                "3" "功能 5 选项 3 描述" \
                "4" "功能 5 选项 4 描述" \
                "5" "功能 5 选项 5 描述" \
                "6" "功能 5 选项 6 描述" \
                "7" "功能 5 选项 7 描述" \
                "8" "功能 5 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function5_1
            ;;
        2 )
            function5_2
            ;;
        3 )
            function5_3
            ;;
        4 )
            function5_4
            ;;
        5 )
            function5_5
            ;;
        6 )
            function5_6
            ;;
        7 )
            function5_7
            ;;
        8 )
            function5_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function5_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 5_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 5_1 Option 1 desc" \
                "2" "Function 5_1 Option 2 desc" \
                "3" "Function 5_1 Option 3 desc" \
                "4" "Function 5_1 Option 4 desc" \
                "5" "Function 5_1 Option 5 desc" \
                "6" "Function 5_1 Option 6 desc" \
                "7" "Function 5_1 Option 7 desc" \
                "8" "Function 5_1 Option 8 desc" \
                "9" "Return to Function 5 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 5_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 5_1 选项 1 描述" \
                "2" "功能 5_1 选项 2 描述" \
                "3" "功能 5_1 选项 3 描述" \
                "4" "功能 5_1 选项 4 描述" \
                "5" "功能 5_1 选项 5 描述" \
                "6" "功能 5_1 选项 6 描述" \
                "7" "功能 5_1 选项 7 描述" \
                "8" "功能 5_1 选项 8 描述" \
                "9" "返回功能 5 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function5_1_1
            ;;
        2 )
            function5_1_2
            ;;
        3 )
            function5_1_3
            ;;
        4 )
            function5_1_4
            ;;
        5 )
            function5_1_5
            ;;
        6 )
            function5_1_6
            ;;
        7 )
            function5_1_7
            ;;
        8 )
            function5_1_8
            ;;
        9 )
            function5
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function5_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_1 executed."
    else
        whiptail --msgbox "功能 5_1_1 已执行。"
    fi
}

function5_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_2 executed."
    else
        whiptail --msgbox "功能 5_1_2 已执行。"
    fi
}

function5_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_3 executed."
    else
        whiptail --msgbox "功能 5_1_3 已执行。"
    fi
}

function5_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_4 executed."
    else
        whiptail --msgbox "功能 5_1_4 已执行。"
    fi
}

function5_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_5 executed."
    else
        whiptail --msgbox "功能 5_1_5 已执行。"
    fi
}

function5_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_6 executed."
    else
        whiptail --msgbox "功能 5_1_6 已执行。"
    fi
}

function5_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_7 executed."
    else
        whiptail --msgbox "功能 5_1_7 已执行。"
    fi
}

function5_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_1_8 executed."
    else
        whiptail --msgbox "功能 5_1_8 已执行。"
    fi
}

function5_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_2 executed."
    else
        whiptail --msgbox "功能 5_2 已执行。"
    fi
}

function5_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_3 executed."
    else
        whiptail --msgbox "功能 5_3 已执行。"
    fi
}

function5_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_4 executed."
    else
        whiptail --msgbox "功能 5_4 已执行。"
    fi
}

function5_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_5 executed."
    else
        whiptail --msgbox "功能 5_5 已执行。"
    fi
}

function5_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_6 executed."
    else
        whiptail --msgbox "功能 5_6 已执行。"
    fi
}

function5_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_7 executed."
    else
        whiptail --msgbox "功能 5_7 已执行。"
    fi
}

function5_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 5_8 executed."
    else
        whiptail --msgbox "功能 5_8 已执行。"
    fi
}

function6() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 6 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 6 Option 1 desc" \
                "2" "Function 6 Option 2 desc" \
                "3" "Function 6 Option 3 desc" \
                "4" "Function 6 Option 4 desc" \
                "5" "Function 6 Option 5 desc" \
                "6" "Function 6 Option 6 desc" \
                "7" "Function 6 Option 7 desc" \
                "8" "Function 6 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 6 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 6 选项 1 描述" \
                "2" "功能 6 选项 2 描述" \
                "3" "功能 6 选项 3 描述" \
                "4" "功能 6 选项 4 描述" \
                "5" "功能 6 选项 5 描述" \
                "6" "功能 6 选项 6 描述" \
                "7" "功能 6 选项 7 描述" \
                "8" "功能 6 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function6_1
            ;;
        2 )
            function6_2
            ;;
        3 )
            function6_3
            ;;
        4 )
            function6_4
            ;;
        5 )
            function6_5
            ;;
        6 )
            function6_6
            ;;
        7 )
            function6_7
            ;;
        8 )
            function6_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function6_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 6_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 6_1 Option 1 desc" \
                "2" "Function 6_1 Option 2 desc" \
                "3" "Function 6_1 Option 3 desc" \
                "4" "Function 6_1 Option 4 desc" \
                "5" "Function 6_1 Option 5 desc" \
                "6" "Function 6_1 Option 6 desc" \
                "7" "Function 6_1 Option 7 desc" \
                "8" "Function 6_1 Option 8 desc" \
                "9" "Return to Function 6 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 6_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 6_1 选项 1 描述" \
                "2" "功能 6_1 选项 2 描述" \
                "3" "功能 6_1 选项 3 描述" \
                "4" "功能 6_1 选项 4 描述" \
                "5" "功能 6_1 选项 5 描述" \
                "6" "功能 6_1 选项 6 描述" \
                "7" "功能 6_1 选项 7 描述" \
                "8" "功能 6_1 选项 8 描述" \
                "9" "返回功能 6 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function6_1_1
            ;;
        2 )
            function6_1_2
            ;;
        3 )
            function6_1_3
            ;;
        4 )
            function6_1_4
            ;;
        5 )
            function6_1_5
            ;;
        6 )
            function6_1_6
            ;;
        7 )
            function6_1_7
            ;;
        8 )
            function6_1_8
            ;;
        9 )
            function6
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done
}

function6_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_1 executed."
    else
        whiptail --msgbox "功能 6_1_1 已执行。"
    fi
}

function6_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_2 executed."
    else
        whiptail --msgbox "功能 6_1_2 已执行。"
    fi
}

function6_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_3 executed."
    else
        whiptail --msgbox "功能 6_1_3 已执行。"
    fi
}

function6_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_4 executed."
    else
        whiptail --msgbox "功能 6_1_4 已执行。"
    fi
}

function6_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_5 executed."
    else
        whiptail --msgbox "功能 6_1_5 已执行。"
    fi
}

function6_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_6 executed."
    else
        whiptail --msgbox "功能 6_1_6 已执行。"
    fi
}

function6_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_7 executed."
    else
        whiptail --msgbox "功能 6_1_7 已执行。"
    fi
}

function6_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_1_8 executed."
    else
        whiptail --msgbox "功能 6_1_8 已执行。"
    fi
}

function6_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_2 executed."
    else
        whiptail --msgbox "功能 6_2 已执行。"
    fi
}

function6_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_3 executed."
    else
        whiptail --msgbox "功能 6_3 已执行。"
    fi
}

function6_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_4 executed."
    else
        whiptail --msgbox "功能 6_4 已执行。"
    fi
}

function6_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_5 executed."
    else
        whiptail --msgbox "功能 6_5 已执行。"
    fi
}

function6_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_6 executed."
    else
        whiptail --msgbox "功能 6_6 已执行。"
    fi
}

function6_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_7 executed."
    else
        whiptail --msgbox "功能 6_7 已执行。"
    fi
}

function6_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 6_8 executed."
    else
        whiptail --msgbox "功能 6_8 已执行。"
    fi
}

function7() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 7 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 7 Option 1 desc" \
                "2" "Function 7 Option 2 desc" \
                "3" "Function 7 Option 3 desc" \
                "4" "Function 7 Option 4 desc" \
                "5" "Function 7 Option 5 desc" \
                "6" "Function 7 Option 6 desc" \
                "7" "Function 7 Option 7 desc" \
                "8" "Function 7 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 7 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 7 选项 1 描述" \
                "2" "功能 7 选项 2 描述" \
                "3" "功能 7 选项 3 描述" \
                "4" "功能 7 选项 4 描述" \
                "5" "功能 7 选项 5 描述" \
                "6" "功能 7 选项 6 描述" \
                "7" "功能 7 选项 7 描述" \
                "8" "功能 7 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function7_1
            ;;
        2 )
            function7_2
            ;;
        3 )
            function7_3
            ;;
        4 )
            function7_4
            ;;
        5 )
            function7_5
            ;;
        6 )
            function7_6
            ;;
        7 )
            function7_7
            ;;
        8 )
            function7_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function7_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 7_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 7_1 Option 1 desc" \
                "2" "Function 7_1 Option 2 desc" \
                "3" "Function 7_1 Option 3 desc" \
                "4" "Function 7_1 Option 4 desc" \
                "5" "Function 7_1 Option 5 desc" \
                "6" "Function 7_1 Option 6 desc" \
                "7" "Function 7_1 Option 7 desc" \
                "8" "Function 7_1 Option 8 desc" \
                "9" "Return to Function 7 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 7_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 7_1 选项 1 描述" \
                "2" "功能 7_1 选项 2 描述" \
                "3" "功能 7_1 选项 3 描述" \
                "4" "功能 7_1 选项 4 描述" \
                "5" "功能 7_1 选项 5 描述" \
                "6" "功能 7_1 选项 6 描述" \
                "7" "功能 7_1 选项 7 描述" \
                "8" "功能 7_1 选项 8 描述" \
                "9" "返回功能 7 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function7_1_1
            ;;
        2 )
            function7_1_2
            ;;
        3 )
            function7_1_3
            ;;
        4 )
            function7_1_4
            ;;
        5 )
            function7_1_5
            ;;
        6 )
            function7_1_6
            ;;
        7 )
            function7_1_7
            ;;
        8 )
            function7_1_8
            ;;
        9 )
            function7
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function7_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_1 executed."
    else
        whiptail --msgbox "功能 7_1_1 已执行。"
    fi
}

function7_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_2 executed."
    else
        whiptail --msgbox "功能 7_1_2 已执行。"
    fi
}

function7_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_3 executed."
    else
        whiptail --msgbox "功能 7_1_3 已执行。"
    fi
}

function7_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_4 executed."
    else
        whiptail --msgbox "功能 7_1_4 已执行。"
    fi
}

function7_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_5 executed."
    else
        whiptail --msgbox "功能 7_1_5 已执行。"
    fi
}

function7_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_6 executed."
    else
        whiptail --msgbox "功能 7_1_6 已执行。"
    fi
}

function7_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_7 executed."
    else
        whiptail --msgbox "功能 7_1_7 已执行。"
    fi
}

function7_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_1_8 executed."
    else
        whiptail --msgbox "功能 7_1_8 已执行。"
    fi
}

function7_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_2 executed."
    else
        whiptail --msgbox "功能 7_2 已执行。"
    fi
}

function7_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_3 executed."
    else
        whiptail --msgbox "功能 7_3 已执行。"
    fi
}

function7_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_4 executed."
    else
        whiptail --msgbox "功能 7_4 已执行。"
    fi
}

function7_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_5 executed."
    else
        whiptail --msgbox "功能 7_5 已执行。"
    fi
}

function7_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_6 executed."
    else
        whiptail --msgbox "功能 7_6 已执行。"
    fi
}

function7_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_7 executed."
    else
        whiptail --msgbox "功能 7_7 已执行。"
    fi
}

function7_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 7_8 executed."
    else
        whiptail --msgbox "功能 7_8 已执行。"
    fi
}

function8() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 8 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 8 Option 1 desc" \
                "2" "Function 8 Option 2 desc" \
                "3" "Function 8 Option 3 desc" \
                "4" "Function 8 Option 4 desc" \
                "5" "Function 8 Option 5 desc" \
                "6" "Function 8 Option 6 desc" \
                "7" "Function 8 Option 7 desc" \
                "8" "Function 8 Option 8 desc" \
                "9" "Return to main menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 8 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 8 选项 1 描述" \
                "2" "功能 8 选项 2 描述" \
                "3" "功能 8 选项 3 描述" \
                "4" "功能 8 选项 4 描述" \
                "5" "功能 8 选项 5 描述" \
                "6" "功能 8 选项 6 描述" \
                "7" "功能 8 选项 7 描述" \
                "8" "功能 8 选项 8 描述" \
                "9" "返回主菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function8_1
            ;;
        2 )
            function8_2
            ;;
        3 )
            function8_3
            ;;
        4 )
            function8_4
            ;;
        5 )
            function8_5
            ;;
        6 )
            function8_6
            ;;
        7 )
            function8_7
            ;;
        8 )
            function8_8
            ;;
        9 )
            main_menu
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function8_1() {
    while true; do
        clear
        if [ $L = "en" ];then
            OPTION=$(whiptail --title "Function 8_1 Menu" --menu "
            Please choose:" 20 60 10 \
                "1" "Function 8_1 Option 1 desc" \
                "2" "Function 8_1 Option 2 desc" \
                "3" "Function 8_1 Option 3 desc" \
                "4" "Function 8_1 Option 4 desc" \
                "5" "Function 8_1 Option 5 desc" \
                "6" "Function 8_1 Option 6 desc" \
                "7" "Function 8_1 Option 7 desc" \
                "8" "Function 8_1 Option 8 desc" \
                "9" "Return to Function 8 menu." \
                "0" "exit." \
                3>&1 1>&2 2>&3)
        else
            OPTION=$(whiptail --title "Function 8_1 Menu" --menu "
            请选择：" 20 60 10 \
                "1" "功能 8_1 选项 1 描述" \
                "2" "功能 8_1 选项 2 描述" \
                "3" "功能 8_1 选项 3 描述" \
                "4" "功能 8_1 选项 4 描述" \
                "5" "功能 8_1 选项 5 描述" \
                "6" "功能 8_1 选项 6 描述" \
                "7" "功能 8_1 选项 7 描述" \
                "8" "功能 8_1 选项 8 描述" \
                "9" "返回功能 8 菜单。" \
                "0" "退出。" \
                3>&1 1>&2 2>&3)
        fi
        case "$OPTION" in
        1 )
            function8_1_1
            ;;
        2 )
            function8_1_2
            ;;
        3 )
            function8_1_3
            ;;
        4 )
            function8_1_4
            ;;
        5 )
            function8_1_5
            ;;
        6 )
            function8_1_6
            ;;
        7 )
            function8_1_7
            ;;
        8 )
            function8_1_8
            ;;
        9 )
            function8
            ;;
        0 | exit | quit | q)
            break
            ;;
        *)
            whiptail --msgbox "无效的选择，请重新选择。"
            ;;
        esac
    done

}

function8_1_1() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_1 executed."
    else
        whiptail --msgbox "功能 8_1_1 已执行。"
    fi
}

function8_1_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_2 executed."
    else
        whiptail --msgbox "功能 8_1_2 已执行。"
    fi
}

function8_1_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_3 executed."
    else
        whiptail --msgbox "功能 8_1_3 已执行。"
    fi
}

function8_1_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_4 executed."
    else
        whiptail --msgbox "功能 8_1_4 已执行。"
    fi
}

function8_1_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_5 executed."
    else
        whiptail --msgbox "功能 8_1_5 已执行。"
    fi
}

function8_1_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_6 executed."
    else
        whiptail --msgbox "功能 8_1_6 已执行。"
    fi
}

function8_1_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_7 executed."
    else
        whiptail --msgbox "功能 8_1_7 已执行。"
    fi
}

function8_1_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_1_8 executed."
    else
        whiptail --msgbox "功能 8_1_8 已执行。"
    fi
}

function8_2() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_2 executed."
    else
        whiptail --msgbox "功能 8_2 已执行。"
    fi
}

function8_3() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_3 executed."
    else
        whiptail --msgbox "功能 8_3 已执行。"
    fi
}

function8_4() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_4 executed."
    else
        whiptail --msgbox "功能 8_4 已执行。"
    fi
}

function8_5() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_5 executed."
    else
        whiptail --msgbox "功能 8_5 已执行。"
    fi
}

function8_6() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_6 executed."
    else
        whiptail --msgbox "功能 8_6 已执行。"
    fi
}

function8_7() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_7 executed."
    else
        whiptail --msgbox "功能 8_7 已执行。"
    fi
}

function8_8() {
    if [ $L = "en" ];then
        whiptail --msgbox "Function 8_8 executed."
    else
        whiptail --msgbox "功能 8_8 已执行。"
    fi
}

function9() {
    if (whiptail --title "Yes/No Box" --yesno "Change Language?
修改语言？" 10 60);then
        if [ $L = "zh" ];then
            L="en"
        else
            L="zh"
        fi
        main_menu
    fi
}

# 主菜单入口
main_menu
