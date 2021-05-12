#!/bin/bash

filepath=$1


byte1=$(jq .data.sub[0].memPeak ${filepath}-1024-16.json)
echo "1: "$byte1
	byte11=$(jq .data.sub[0].memOff ${filepath}-1024-16.json)
	echo "11: "$byte11
	byte1=$((byte1+byte11))
	echo "1: "$byte1
	byte2=$(jq .data.sub[3].memPeak ${filepath}-1024-16.json)
	echo "2: "$byte2
	byte22=$(jq .data.sub[3].memOff ${filepath}-1024-16.json)
	echo "22: "$byte22
	byte2=$((byte2+byte22))
	echo "2: "$byte2
	
	
		echo "& "$((byte1/1000000))" "
	
		echo "& "$((byte2/1000000))" "
	
