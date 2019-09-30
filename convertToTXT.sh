#!/bin/bash

#formats=".mobi .epub .txt .fb2"
formats=".fb2"
indir=./data 

converter=ebook-convert 
converter_package=calibre

conv()
{
	out=`echo $1 | sed -e 's/ /_/g'`
	out=`basename $out $2`.txt
	ebook-convert "$1" in/$out && echo file: `basename $out .txt`
}
export -f conv 

if [[ -z `which $converter` ]]
then
	echo $converter from package $converter_package have to be installed.
else
	for format in $formats
	do
		mask="$indir/*$format"
		echo "$mask"
		find . -wholename "$mask" -type f -exec bash -c 'conv "{}" "$format"' \;
	done
fi
