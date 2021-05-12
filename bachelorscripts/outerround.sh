#!/bin/bash

testfilespath='/home/chris/testwerte/'

max_window='16384'
threshold='2'


# window , thrshold , filetotest, savefilename
function test {
	echo "running testrk with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-buz -a "lz77Aprox(coder=left(binary,binary,huff),window=$1,threshold=$2)" --stats -f -0 $3 >> $4 &

}
 

#window threshold
function testall {
	
	
		
	test $1 $2 ${testfilespath}einstein.de.txt store-buz/random.100Mb-${1}-${2}.json
	P1=$!
	
	wait  $P1 $P2 
	
}



#max min
function runup {

	
	min=$2
	max=$1
	
	while [ "$max" -gt "$min" ]
	do
		
	
		testall $max $min
		min=$((2*min))
	done
}

window=$max_window

echo "start"


	echo "round to: " $window " from: " $threshold

	runup  $window $threshold

	window=$((window/2))

