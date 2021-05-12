#!/bin/bash

filepath=$1


# jqpattern='\'.data.timeDelta\''
# jqpattern='\'.meta.rate\''
#jqpattern='\'.data.memPeak\''

#$1 how many empty
function printempty {
	c=$1
	
	while [ "$c" -gt 0 ]
	 do
		printf "& "
		c=$((c-1))
	done
}
#line $1 spalte $2
function printfill {
	
	
	
	expl=$((1+$1))
	pwrl=$((2 ** expl))
	
	expr=$((1+$2))
	pwrr=$((2 ** expr))
	
	byte1=$(jq .data.sub[0].memPeak ${filepath}-${pwrr}-${pwrl}.json)
	byte11=$(jq .data.sub[0].memOff ${filepath}-${pwrr}-${pwrl}.json)
	byte1=$((byte1+byte11))
	byte2=$(jq .data.sub[3].memPeak ${filepath}-${pwrr}-${pwrl}.json)
	byte22=$(jq .data.sub[3].memOff ${filepath}-${pwrr}-${pwrl}.json)
	byte2=$((byte2+byte22))
	
	if ((byte1 > byte2)); then
		printf "& "$((byte1/1000000))" "
	else
		printf "& "$((byte2/1000000))" "
	fi
	
	
}

#$1 line number zero to 9
function makeline {
	
	makels $1
	inp=$1
	printempty $inp	
	inp=$((inp+1))
	while [ "$inp" -lt 15 ]
	do
		
		printfill $1 $inp
		
		inp=$((inp+1))
	done
	
	printf "\\\\\ \\cline{1-1} \n"
}
# $1 linecount
function makels {
	expl=$((1+$1))
	pwrl=$((2 ** expl))
	printf "\multicolumn{1}{|l|}{$pwrl} "
}

printf "	\\\begin{table}[h]\n"
printf "\\\begin{tabular}{rrrrrrrrrrrrrrr}\n"
printf "\multicolumn{1}{l}{threshold} &  &  &  &  &  &  &  &  &  &  &  &  &  &  \\\\\\ \cline{1-1}\n"

	lc=$((13))
	while [ $lc -gt -1 ] 
	do
		
		makeline $lc
		if((lc == 0)); then
			echo "\hline"
		else
			echo ""
		fi		
		
		lc=$((lc - 1))
	done
	
printf "\multicolumn{1}{l|}{window} & \multicolumn{1}{l|}{4} & \multicolumn{1}{l|}{8} & \multicolumn{1}{l|}{16} & \multicolumn{1}{l|}{32} & \multicolumn{1}{l|}{64} & \multicolumn{1}{l|}{128} & \multicolumn{1}{l|}{256} & \multicolumn{1}{l|}{512} & \multicolumn{1}{l|}{1024} & \multicolumn{1}{l|}{2048} & \multicolumn{1}{l|}{4096} & \multicolumn{1}{l|}{8129} & \multicolumn{1}{l|}{16384} & \multicolumn{1}{l|}{32768} \\\\\\ \cline{2-15} 
\\\end{tabular}
\\\\end{table}"
