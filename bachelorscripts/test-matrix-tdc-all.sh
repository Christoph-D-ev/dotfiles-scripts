#!/bin/bash

testfilespath='/home/chris/testwerte/'

max_window='32768'
threshold='2'


# window , thrshold , filetotest, savefilename
function test {
	echo "running testrk with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-nth -a "lz77Aprox(coder=left(binary,binary,huff),window=$1,threshold=$2)" --stats -f -0 $3 >> $4 &

}

function testdna {

echo "running test with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-buz -a "lz77Aprox(coder=left(binary,binary,huff),window=$1,threshold=$2)" --stats -f -0 $3 >> $4 &

}

function testrk {

echo "running test with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-rk -a "lz77Aprox(coder=left(binary,binary,huff),window=$1,threshold=$2)" --stats -f -0 $3 >> $4 &

}
 

#window threshold
function testall {
	
	
	sed -i '/hello/d' store-nth/dna-${1}-${2}.json
	sed -i '/^$/d' store-nth/dna-${1}-${2}.json
	#P1=$!	
	#test $1 $2 ${testfilespath}random.100MB store-djb/random-${1}-${2}.json
	#P2=$!
	#testdna $1 $2 ${testfilespath}random.100MB_0 store-buz/random-${1}-${2}.json
	#P3=$!
	#testrk $1 $2 ${testfilespath}random.100MB_ store-rk/random-${1}-${2}.json
	#P4=$!
	#wait $P1  
	
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

while [ "$window" -gt "$threshold" ]
do
	echo "round to: " $window " from: " $threshold

	runup  $window $threshold

	window=$((window/2))
done
