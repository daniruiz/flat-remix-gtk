#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Required applications
INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

index="$DIR/assets.txt"
# The loop below generates a png file for each asset element listed in $index.
# These assets are extracted from .svg files located in $DIR
for src in "$DIR"/assets*.svg; do
	variant=$(basename ${src%.svg})
	mkdir "$DIR/$variant"
	for i in $(cat "$index"); do
		if [ ! -f "$variant/$i.png" ]; then
			echo Rendering "$variant/$i.png"
			$INKSCAPE --export-id=$i \
					  --export-id-only \
					  --export-png="$DIR/$variant/$i.png" "$src" 1> /dev/null &&
				$OPTIPNG -o7 --quiet "$DIR/$variant/$i.png" ||
				echo "Error occurred when rendering $DIR/$variant/$i.png" 1>&2
		fi
	done
done
