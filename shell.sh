#!/bin/bash

inlist=`ls in/*.txt`
outdir=out/

for i in $inlist
do
	outname=$outdir`basename $i .txt`.words
	./Main $i > $outname
	basename $outname 
done
