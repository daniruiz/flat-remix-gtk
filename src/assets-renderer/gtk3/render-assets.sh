#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

SRC_FILE="$DIR"/assets.svg
ASSETS_DIR="$DIR"/assets
INDEX="$DIR"/assets.txt

mkdir "$ASSETS_DIR"

for i in $(cat "$INDEX")
do 
	if [ -f "$ASSETS_DIR/$i.png" ]; then
		echo "$ASSETS_DIR/$i.png" exists.
	else
		echo
		echo Rendering "$ASSETS_DIR/$i.png"
		$INKSCAPE --export-id=$i \
			      --export-id-only \
			      --export-png="$ASSETS_DIR/$i.png" "$SRC_FILE" &> /dev/null \
		&& $OPTIPNG -o7 --quiet "$ASSETS_DIR/$i.png" 
	fi
	if [ -f "$ASSETS_DIR"/$i@2.png ]; then
		echo "$ASSETS_DIR"/$i@2.png exists.
	else
		echo
		echo Rendering "$ASSETS_DIR"/$i@2.png
		$INKSCAPE --export-id=$i \
			      --export-dpi=180 \
			      --export-id-only \
			      --export-png="$ASSETS_DIR"/$i@2.png "$SRC_FILE" &> /dev/null \
		&& $OPTIPNG -o7 --quiet "$ASSETS_DIR"/$i@2.png 
	fi
done

