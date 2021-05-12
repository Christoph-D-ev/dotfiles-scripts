#!/bin/bash

byte1=$(jq .data.sub[0].memPeak $1)
	byte11=$(jq .data.sub[0].memOff $1)
	byte1=$((byte1+byte11))
	byte2=$(jq .data.sub[3].memPeak $1)
	byte22=$(jq .data.sub[3].memOff $1)
	byte2=$((byte2+byte22))
	
	if ((byte1 > byte2)); then
		echo "mem: "$((byte1/1000000))" "
	else
		echo "mem: "$((byte2/1000000))" "
	fi


rate=$(jq .meta.rate $1)
rateb=${rate#*.}
rateb=${rateb:0:4}
echo "rate: "${rate%.*}"."$rateb

time=$(jq .data.timeDelta $1)
time=${time%.*}
	echo "time: "$((time/1000))" "
