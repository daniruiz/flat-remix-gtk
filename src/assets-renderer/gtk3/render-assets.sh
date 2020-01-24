#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Required applications
INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

assets="$DIR/assets"
# Required directories
[ ! -d "$assets" ] && mkdir "$assets"

src="$DIR/assets.svg"
index="$DIR/assets.txt"

# The loop below generates two png files, with different DPI settings, for each
# asset element listed in $index. These assets are extracted from .svg files
# located in $DIR
for i in $(cat "$index"); do
	if [ ! -f "$assets/$i.png" ]; then
		echo "Rendering $assets/$i.png"
		$INKSCAPE --export-id="$i" \
				  --export-id-only \
				  --export-png="$assets/$i.png" "$src" 1> /dev/null &&
			$OPTIPNG -o7 --quiet "$assets/$i.png" ||
			echo "Error occurred when rendering $assets/$i.png" 1>&2

		# @TODO a better naming is needed, perhaps @180dpi.png?
		echo "Rendering $assets/$i@2.png"
		$INKSCAPE --export-id="$i" \
				  --export-dpi=180 \
				  --export-id-only \
				  --export-png="$assets/$i@2.png" "$src" 1> /dev/null &&
			$OPTIPNG -o7 --quiet "$assets/${i}@2.png" ||
			echo "Error occurred when rendering $assets/${i}@2.png" 1>&2
	fi
done
