#!/bin/sh
head=1
tail=0
randomnumber=$((RANDOM%2))
if [ $randomnumber -eq $head ]
then
	echo "Head"
else
	echo "Tail"
fi