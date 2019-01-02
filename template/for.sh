#!/bin/bash
#for的多种形式

for((i=0;i<=100;i++))
do
echo $i
done

for i in {1..100}
do
echo $i
done


sum=0
for((i=1;i<=100;i++))
do
	sum=$(($sum + $i ))
done
echo 'sum='$sum



