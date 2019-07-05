#!/bin/bash
KEY=()
echo "Press a direction Key:"
while :
do
#echo "Press a direction Key:"
read -s -n 1 KEY
#echo ${KEY[@]}
#echo "Length:`expr ${#KEY}`"
#echo ${KEY[0]}
case ${KEY[0]} in
"B")
echo "Down key pressed"
;;
"A")
echo "UP key pressed"
;;
"D")
echo "Left key pressed"
;;
"C")
echo "Right key pressed"
;;
*)
continue
#echo "Unknown key"
;;
esac
done
