#!/bin/bash

formats=".mobi .epub"
indir=./data 

converter=ebook-convert 
converter_package=calibre

if [[ -z `which $converter` ]]
then
	echo $converter from package $converter_package have to be installed.
else
	for format in $formats
	do
		mask="$indir/*$format"
		if [ -f $mask ]
		then 
			for i in $indir/*$format
			do
				out=`echo $i | sed -e 's/ /_/g'`
				out=`basename $out .mobi`.txt
				ebook-convert "$i" in/$out && echo file: `basename $out .txt`
			done
		fi
	done
fi
