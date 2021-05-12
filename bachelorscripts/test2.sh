#!/bin/bash

testfilespath='/home/chris/testwerte/'

window='32768'
threshold='8192'

# window , thrshold , filetotest, savefilename
function test {
	echo "running testlcp with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-rk -a "lzss_lcp(coder=left(binary,binary,huff),threshold=$2)" --stats -f -0 $3 >> $4 &

}

function testdna {

echo "running test with: " $1 "," $2 "," $3
	/home/chris/test/tdc-store-nth -a "lz77Aprox(coder=left(binary,binary,huff),window=$1,threshold=$2)" --stats -f -0 $3 >> $4 &

}

#window threshold
function testall {
	
	
	
	test $1 $2 ${testfilespath}dblp.xml.200MB dblp.xml-${1}-${2}.json
	P2=$!
	test $1 $2 ${testfilespath}proteins.200MB proteins-${1}-${2}.json
	P3=$!
	test $1 $2 ${testfilespath}english.200MB english-${1}-${2}.json
	P4=$!
	test $1 $2 ${testfilespath}dna.200MB dna-${1}-${2}.json
	P5=$!	
	
	
	wait $P2 $P3 $P4 $P5 
	
}

while [ "$window" -gt "$threshold" ]
do
	testall $window $threshold
	threshold=$((threshold*2))
done
