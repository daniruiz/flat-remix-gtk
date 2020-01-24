#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Required applications
INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

# Required directories
[ ! -d "$DIR/menubar-toolbar" ] && mkdir "$DIR/menubar-toolbar"

# Template variations
templates=( "" "-dark" "-darkest" )

index="$DIR/assets.txt"
# For each variation
for t in "${templates[@]}"; do
	src="$DIR/assets${t}.svg"
	assets="$DIR/assets${t}"
	mkdir "$assets"
	# The loop below generates a png file for each asset element listed in $index.
	# These assets are extracted from .svg files located in $DIR
	for i in $(cat "$index"); do
		if [ ! -f "$assets/$i.png" ]; then
			echo "Rendering $assets/$i.png"
			$INKSCAPE --export-id="$i" \
					  --export-id-only \
					  --export-png="$assets/$i.png" "$src" 1> /dev/null &&
				$OPTIPNG -o7 --quiet "$assets/$i.png" ||
				echo "Error occurred when rendering $assets/$i.png" 1>&2
		fi
	done

	# Duplicate some rendered files for menubar/toolbar; example
	# entry-toolbar.png for the dark variation should be placed as
	# menubar-toolbar/entry-toolbar-dark.png.

	# @TODO Note that all menubar assets are shared between template variations.
	# Because of this, the theme template may not use some of these files. It is
	# a good idea to remove them.

	# @TODO There is no reason why this needs to be hard-coded here. Perhaps,
	# having another 'index' file for these renames would be beneficial.
	cp "$assets/entry-toolbar.png" "$DIR/menubar-toolbar/entry-toolbar${t}.png"
	cp "$assets/entry-active-toolbar.png" "$DIR/menubar-toolbar/entry-active-toolbar${t}.png"
	cp "$assets/entry-disabled-toolbar.png" "$DIR/menubar-toolbar/entry-disabled-toolbar${t}.png"
	cp "$assets/menubar.png" "$DIR/menubar-toolbar/menubar${t}.png"
	cp "$assets/menubar_button.png" "$DIR/menubar-toolbar/menubar_button${t}.png"
	# Special cases
	if [ "$t" = "-dark" ]; then
		cp "$assets/button.png" "$DIR/menubar-toolbar/button.png"
		cp "$assets/button-hover.png" "$DIR/menubar-toolbar/button-hover.png"
		cp "$assets/button-active.png" "$DIR/menubar-toolbar/button-active.png"
		cp "$assets/button-insensitive.png" "$DIR/menubar-toolbar/button-insensitive.png"
	fi
done
