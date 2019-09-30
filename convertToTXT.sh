#!/bin/bash

formats=".mobi .epub .txt .fb2"
indir=./data 
log="$indir/.convertToTXT.log"

converter=ebook-convert 
converter_package=calibre

date > "$log"
echo "Converting have been started." >> "$log"

conv()
{
	echo conv
	date >> "$3"
	echo "Started converting of $1" >> "$3"
	out=`echo $1 | sed -e 's/ /_/g'`
	out=`basename $out $2`.txt
	ebook-convert "$1" in/$out && echo file: `basename $out .txt`
	date >> "$3"
	echo "Finished converting of $1" >> "$3"
}
export -f conv 

if [[ -z `which $converter` ]]
then
	echo $converter from package $converter_package have to be installed.
else
	for format in $formats
	do
		mask="$indir/*$format"
		find . -wholename "$mask" -type f -exec bash -c "conv \"{}\" \"$format\" \"$log\"" \;
	done
fi
