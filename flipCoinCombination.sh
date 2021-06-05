#!/bin/sh
declare -A countS
declare -A countD
declare -A countT
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

# Simulate Singlt combinaion
for ((i=0; i<50; i++))
do
	random1=$((RANDOM%2))
	randomC1=$(characterConvert $random1)
	if [ -v countS[$randomC1] ]
	then
		((countS[$randomC1]++))
	else
		countS[$randomC1]=1
	fi
done
echo "Winner in Singlt combinaion"
for key in "${!countS[@]}"
do
	# echo "Percentage of $key =" $((${countS[$key]} * 100 / 50))
	# echo ${countS[$key]}
	echo $key ' - ' ${countS["$key"]}
done | sort -rn -k3 | head -1
# echo ${countS[@]}

# Simulate Double combinaion
for ((i=0; i<50; i++))
do
	random1=$((RANDOM%2))
	random2=$((RANDOM%2))
	randomC1=$(characterConvert $random1)
	randomC2=$(characterConvert $random2)
	if [ -v countD[$randomC1$randomC2] ]
	then
		((countD[$randomC1$randomC2]++))
	else
		countD[$randomC1$randomC2]=1
	fi
done
echo "Winner in Double combinaion"
for key in "${!countD[@]}"
do
	# echo "Percentage of $key =" $((${countD[$key]} * 100 / 50))
	echo $key ' - ' ${countD["$key"]}
done | sort -rn -k3 | head -1

# Simulate Triplet combinaion
for ((i=0; i<50; i++))
do
	random1=$((RANDOM%2))
	random2=$((RANDOM%2))
	random3=$((RANDOM%2))
	randomC1=$(characterConvert $random1)
	randomC2=$(characterConvert $random2)
	randomC3=$(characterConvert $random3)
	if [ -v countT[$randomC1$randomC2$randomC3] ]
	then
		((countT[$randomC1$randomC2$randomC3]++))
	else
		countT[$randomC1$randomC2$randomC3]=1
	fi
done
echo "Winner in Triplets combinaion"
for key in "${!countT[@]}"
do
	# echo "Percentage of $key =" $((${countT[$key]} * 100 / 50))
	echo $key ' - ' ${countT["$key"]}
done | sort -rn -k3 | head -1
