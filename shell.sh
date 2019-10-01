#!/bin/bash

outdir=./out/
indir=./in/
log=./out/.vocabularty-meter.log

date > "$log"
echo "Vocabulary-meter: processing have been started." >> "$log"

inlist=`find "$indir" -name "*.txt" -type f`

for i in $inlist
do
	outname=$outdir`basename $i .txt`.words
	date >> "$log"
	echo "Processing of $i have been started." >> "$log"
	./Main $i > $outname
	date >> "$log"
	echo "Processing of $i have been finished." >> "$log"
done

date >> "$log"
echo "Vocabulary-meter: processing have been finished." >> "$log"
