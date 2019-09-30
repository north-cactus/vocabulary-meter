#!/bin/bash

input=out/*.words
out=out/statistics
out2=out/statistics2

rm $out

for i in $input
do
	head -n1 $i >> $out	
	#basename $i >> $out2
	#head -n1 $1 >> $out2
done
