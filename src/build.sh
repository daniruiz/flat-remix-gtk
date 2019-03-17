#!/bin/sh

TMP="/tmp/flat-remix-gtk"
ASSETS_DIR=../assets-renderer/gtk3/assets

rm -rf "$TMP"
mkdir -p "$TMP"

# Build CSS files
for scss in sass/*.scss
do
	echo "Generate ${scss}"
	scss --sourcemap=none -C -q "$scss" "$TMP"/"$(basename ${scss%%.scss})".css
done


# Copy CSS files
cp -f "$TMP"/gtk.css ../Flat-Remix-GTK/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-solid.css ../Flat-Remix-GTK-Solid/gtk-3.0/gtk.css

cp -f "$TMP"/gtk-dark.css ../Flat-Remix-GTK/gtk-3.0/gtk-dark.css
cp -f "$TMP"/gtk-dark.css ../Flat-Remix-GTK-Dark/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-dark.css ../Flat-Remix-GTK-Darker/gtk-3.0/gtk-dark.css
cp -f "$TMP"/gtk-dark-solid.css ../Flat-Remix-GTK-Solid/gtk-3.0/gtk-dark.css
cp -f "$TMP"/gtk-dark-solid.css ../Flat-Remix-GTK-Dark-Solid/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-dark-solid.css ../Flat-Remix-GTK-Darker-Solid/gtk-3.0/gtk-dark.css

cp -f "$TMP"/gtk-darker.css ../Flat-Remix-GTK-Darker/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-darker-solid.css ../Flat-Remix-GTK-Darker-Solid/gtk-3.0/gtk.css

cp -f "$TMP"/gtk-darkest.css ../Flat-Remix-GTK-Darkest/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-darkest-solid.css ../Flat-Remix-GTK-Darkest-Solid/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-darkest-noBorder.css ../Flat-Remix-GTK-Darkest-NoBorder/gtk-3.0/gtk.css
cp -f "$TMP"/gtk-darkest-solid-noBorder.css ../Flat-Remix-GTK-Darkest-Solid-NoBorder/gtk-3.0/gtk.css

# Generate assets
if [[ $1 != "--no-assets" ]]
then
	cp -r assets-renderer "$TMP"/
	"$TMP"/assets-renderer/gtk2/render-assets.sh
	"$TMP"/assets-renderer/gtk3/render-assets.sh
	"$TMP"/assets-renderer/metacity/render-assets.sh

	for theme in ../Flat-Remix-GTK*
	do
		rm "$theme"/gtk-3.0/assets/*
		cp -f "$TMP"/assets-renderer/gtk3/assets/* "$theme"/gtk-3.0/assets/

		rm "$theme"/gtk-2.0/assets/*
		rm "$theme"/metacity-1/*.svg
		case "$theme" in
			*Darkest*)
				cp -f "$TMP"/assets-renderer/gtk2/assets-darkest/* "$theme"/gtk-2.0/assets/
				cp -f "$TMP"/assets-renderer/metacity/metacity-darkest/* "$theme"/metacity-1/
				;;
			*Dark|*Dark-*)
				cp -f "$TMP"/assets-renderer/gtk2/assets-dark/* "$theme"/gtk-2.0/assets/
				cp -f "$TMP"/assets-renderer/metacity/metacity-dark/* "$theme"/metacity-1/
				;;
			*Darker|*Darker-*)
				cp -f "$TMP"/assets-renderer/gtk2/assets/* "$theme"/gtk-2.0/assets/
				cp -f "$TMP"/assets-renderer/metacity/metacity-darkest/* "$theme"/metacity-1/
				;;
			*)
				cp -f "$TMP"/assets-renderer/gtk2/assets/* "$theme"/gtk-2.0/assets/
				cp -f "$TMP"/assets-renderer/metacity/metacity/* "$theme"/metacity-1/
				;;
		esac

		rm "$theme"/gtk-2.0/menubar-toolbar/*.png
		cp -f "$TMP"/assets-renderer/gtk2/menubar-toolbar/* "$theme"/gtk-2.0/menubar-toolbar/
	done
fi

