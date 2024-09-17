while true; do
read -p "同意请输入Y/y,不同意请输入N/n: " choice

case "$choice" in
  Y|y) echo "选择了Y" ;break;;
  N|n) echo "选择了N" ;break;;
  *) echo "输入错误，重新输入" ;;
esac
done
