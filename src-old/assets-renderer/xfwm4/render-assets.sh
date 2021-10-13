#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

INDEX="$DIR"/assets.txt
SRC_FILES="$DIR"/assets*.svg


for src_file in $SRC_FILES
do
	variant=$(basename ${src_file%.svg})
	mkdir "$DIR"/$variant
	for i in $(cat "$INDEX")
	do
		if [ -f "$variant/$i.png" ]; then
			echo "$variant/$i.png" exists.
		else
			echo
			echo Rendering "$variant/$i.png"
			$INKSCAPE --export-id=$i \
					  --export-id-only \
					  --export-png="$DIR/$variant/$i.png" "$src_file" &> /dev/null \
			&& $OPTIPNG -o7 --quiet "DIR/$variant/$i.png" 
		fi
	done
done
