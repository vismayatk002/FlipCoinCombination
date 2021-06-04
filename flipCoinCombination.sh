#!/bin/sh
declare -A count
head=1
tail=0
count[head]=0
count[tail]=0
for ((i=0; i<50; i++))
do
	randomnumber=$((RANDOM%2))
	if [ $randomnumber -eq $head ]
	then
		((count[head]++))
	else
		((count[tail]++))
	fi
done
for key in "${!count[@]}"
do
	echo "Percentage of $key =" $((${count[$key]} * 100 / 50))
done
