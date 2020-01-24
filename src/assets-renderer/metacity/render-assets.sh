#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Required applications
INKSCAPE=/usr/bin/inkscape

src="$DIR/../gtk3/assets.svg"

# Template variations
templates=( "" "-dark" "-darkest" )

# The purpose of this loop is to render some assets and renaming them as necessary
for t in "${templates[@]}"; do
	assets="$DIR/metacity${t}"
	index="$DIR/assets${t}.txt"

	# @TODO Unless the source svg files are forked, this loop can be greatly
	# simplified if we could adjust the source svg files
	mkdir "$assets"
	for i in $(cat "$index"); do
		if [ ! -f "$assets/$i.svg" ]; then
			echo "Rendering $assets/$i.svg"

			if [ -z "$t" ]; then
				name=$(echo "${i#titlebutton-}.svg")
			else
				name=$(echo "${i#titlebutton-}.svg" | sed "s/${t}//")
			fi
			$INKSCAPE --export-id="$i" \
					  --export-id-only \
					  --export-plain-svg="$assets/$name" "$src" 1> /dev/null ||
				echo "Error occurred when rendering $assets/$i.png" 1>&2
		fi
	done
	mv "$assets"/appmenu-backdrop.svg "$assets"/unfocused.svg
done
