#!/bin/bash


i=1
while [ "$i" -le 10  ]
do

	sum=$(($i * $i ))
	echo $sum
	i=$(($i+1))
done



num=1
sum=0
while(("$num" <= 100))
do
	sum=$(($sum + $num))
	let num++

done


echo 'sum='$sum
