#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

INKSCAPE=/usr/bin/inkscape

SRC_FILE="$DIR"/../gtk3/assets.svg

ASSETS_DIR="$DIR"/metacity
INDEX="$DIR"/assets.txt

ASSETS_DIR_DARK="$DIR"/metacity-dark
INDEX_DARK="$DIR"/assets-dark.txt

ASSETS_DIR_DARKEST="$DIR"/metacity-darkest
INDEX_DARKEST="$DIR"/assets-darkest.txt

mkdir "$ASSETS_DIR" "$ASSETS_DIR_DARK" "$ASSETS_DIR_DARKEST"

for i in `cat "$INDEX"`
do 
	if [ -f "$ASSETS_DIR/$i.svg" ]; then
		echo "$ASSETS_DIR/$i.svg" exists.
	else
		echo
		echo Rendering "$ASSETS_DIR/$i.svg"
		$INKSCAPE --export-id=$i \
			      --export-id-only \
			      --export-plain-svg="$ASSETS_DIR/${i#titlebutton-}.svg" "$SRC_FILE" &> /dev/null
	fi
done
mv "$ASSETS_DIR"/appmenu-backdrop.svg "$ASSETS_DIR"/unfocused.svg

for i in `cat "$INDEX_DARK"`
do 
	if [ -f "$ASSETS_DIR_DARK/$i.svg" ]; then
		echo "$ASSETS_DIR_DARK/$i.svg" exists.
	else
		echo
		echo Rendering "$ASSETS_DIR_DARK/$i.svg"
		$INKSCAPE --export-id=$i \
			      --export-id-only \
			      --export-plain-svg="$ASSETS_DIR_DARK/$(echo ${i#titlebutton-} | sed "s/-dark//").svg" "$SRC_FILE" &> /dev/null
	fi
done
mv "$ASSETS_DIR_DARK"/appmenu-backdrop.svg "$ASSETS_DIR_DARK"/unfocused.svg

for i in `cat "$INDEX_DARKEST"`
do 
	if [ -f "$ASSETS_DIR_DARKEST/$i.svg" ]; then
		echo "$ASSETS_DIR_DARKEST/$i.svg" exists.
	else
		echo
		echo Rendering "$ASSETS_DIR_DARKEST/$i.svg"
		$INKSCAPE --export-id=$i \
			      --export-id-only \
			      --export-plain-svg="$ASSETS_DIR_DARKEST/$(echo ${i#titlebutton-} | sed "s/-darkest//").svg" "$SRC_FILE" &> /dev/null
	fi
done
mv "$ASSETS_DIR_DARKEST"/appmenu-backdrop.svg "$ASSETS_DIR_DARKEST"/unfocused.svg

