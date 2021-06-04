#!/bin/sh
declare -A count
head=1
tail=0
function characterConvert(){
	
	if [ $1 -eq 1 ]
	then
		echo "H"
	else
		echo "T"
	fi

}
for ((i=0; i<50; i++))
do
	random1=$((RANDOM%2))
	random2=$((RANDOM%2))
	randomC1=$(characterConvert $random1)
	randomC2=$(characterConvert $random2)
	if [ -v count[$randomC1$randomC2] ]
	then
		((count[$randomC1$randomC2]++))
	else
		count[$randomC1$randomC2]=1
	fi
done
for key in "${!count[@]}"
do
	echo "Percentage of $key =" $((${count[$key]} * 100 / 50))
done
