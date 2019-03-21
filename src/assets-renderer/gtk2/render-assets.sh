#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

SRC_FILE="$DIR"/assets.svg
ASSETS_DIR="$DIR"/assets

SRC_FILE_DARK="$DIR"/assets-dark.svg
ASSETS_DIR_DARK="$DIR"/assets-dark

SRC_FILE_DARKEST="$DIR"/assets-darkest.svg
ASSETS_DIR_DARKEST="$DIR"/assets-darkest

MENU_TOOLBAR_DIR="$DIR"/menubar-toolbar

INDEX="$DIR"/"assets.txt"

mkdir "$ASSETS_DIR" "$ASSETS_DIR_DARK" "$ASSETS_DIR_DARKEST" "$MENU_TOOLBAR_DIR"

for i in $(cat $INDEX)
do
	if [ -f $ASSETS_DIR/$i.png ]; then
		echo $ASSETS_DIR/$i.png exists.
	else
		echo
		echo Rendering $ASSETS_DIR/$i.png
		$INKSCAPE --export-id=$i \
		          --export-id-only \
		          --export-png=$ASSETS_DIR/$i.png $SRC_FILE &> /dev/null \
		&& $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png 
	fi

	if [ -f $ASSETS_DIR_DARK/$i.png ]; then
		echo $ASSETS_DIR_DARK/$i.png exists.
	else
		echo
		echo Rendering $ASSETS_DIR_DARK/$i.png
		$INKSCAPE --export-id=$i \
		          --export-id-only \
		          --export-png=$ASSETS_DIR_DARK/$i.png $SRC_FILE_DARK &> /dev/null \
		&& $OPTIPNG -o7 --quiet $ASSETS_DIR_DARK/$i.png 
	fi

	if [ -f $ASSETS_DIR_DARKEST/$i.png ]; then
		echo $ASSETS_DIR_DARKEST/$i.png exists.
	else
		echo
		echo Rendering $ASSETS_DIR_DARKEST/$i.png
		$INKSCAPE --export-id=$i \
		          --export-id-only \
		          --export-png=$ASSETS_DIR_DARKEST/$i.png $SRC_FILE_DARKEST &> /dev/null \
		&& $OPTIPNG -o7 --quiet $ASSETS_DIR_DARKEST/$i.png 
	fi
done

cp $ASSETS_DIR/entry-toolbar.png "$MENU_TOOLBAR_DIR"/entry-toolbar.png
cp $ASSETS_DIR/entry-active-toolbar.png "$MENU_TOOLBAR_DIR"/entry-active-toolbar.png
cp $ASSETS_DIR/entry-disabled-toolbar.png "$MENU_TOOLBAR_DIR"/entry-disabled-toolbar.png

cp $ASSETS_DIR/menubar.png "$MENU_TOOLBAR_DIR"/menubar.png
cp $ASSETS_DIR/menubar_button.png "$MENU_TOOLBAR_DIR"/menubar_button.png


cp $ASSETS_DIR_DARK/button.png "$MENU_TOOLBAR_DIR"/button.png
cp $ASSETS_DIR_DARK/button-hover.png "$MENU_TOOLBAR_DIR"/button-hover.png
cp $ASSETS_DIR_DARK/button-active.png "$MENU_TOOLBAR_DIR"/button-active.png
cp $ASSETS_DIR_DARK/button-insensitive.png "$MENU_TOOLBAR_DIR"/button-insensitive.png

cp $ASSETS_DIR_DARK/entry-toolbar.png "$MENU_TOOLBAR_DIR"/entry-toolbar-dark.png
cp $ASSETS_DIR_DARK/entry-active-toolbar.png "$MENU_TOOLBAR_DIR"/entry-active-toolbar-dark.png
cp $ASSETS_DIR_DARK/entry-disabled-toolbar.png "$MENU_TOOLBAR_DIR"/entry-disabled-toolbar-dark.png

cp $ASSETS_DIR_DARK/menubar.png "$MENU_TOOLBAR_DIR"/menubar-dark.png
cp $ASSETS_DIR_DARK/menubar_button.png "$MENU_TOOLBAR_DIR"/menubar_button-dark.png

cp $ASSETS_DIR_DARKEST/entry-toolbar.png "$MENU_TOOLBAR_DIR"/entry-toolbar-darkest.png
cp $ASSETS_DIR_DARKEST/entry-active-toolbar.png "$MENU_TOOLBAR_DIR"/entry-active-toolbar-darkest.png
cp $ASSETS_DIR_DARKEST/entry-disabled-toolbar.png "$MENU_TOOLBAR_DIR"/entry-disabled-toolbar-darkest.png

cp $ASSETS_DIR_DARKEST/menubar.png "$MENU_TOOLBAR_DIR"/menubar-darkest.png
cp $ASSETS_DIR_DARKEST/menubar_button.png "$MENU_TOOLBAR_DIR"/menubar_button-darkest.png

