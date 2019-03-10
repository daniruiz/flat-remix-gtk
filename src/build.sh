#!/bin/sh

TMP="/tmp/flat-remix-gtk"
ASSETS_DIR=../assets-renderer/gtk3/assets

rm -rf "$TMP"
mkdir -p "$TMP"

# Build CSS files
for scss in sass/*.scss
do
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

