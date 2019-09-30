#!/bin/bash

in=data/100books/*.mobi

converter=ebook-convert
converter_package=calibre

if [[ -z `which ls` ]]
then
	echo $converter from package $converter_package have to be installed.
else
	echo Ok.
	for i in $in
	do
		out=`echo $i | sed -e 's/ /_/g'`
		out=`basename $out .mobi`.txt
		ebook-convert "$i" in/$out && echo file: `basename $out .txt`
	done
fi
