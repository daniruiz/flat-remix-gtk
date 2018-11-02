#!/bin/bash

ASSETS_DIR=../assets-renderer/gtk3/assets

sass gtk.scss > gtk.css
sass gtk-dark.scss > gtk-dark.css
sass gtk-darkest.scss > gtk-darkest.css
sass gtk-darker.scss > gtk-darker.css


cp -f gtk.css 		../Flat-Remix-GTK/gtk-3.0/gtk.css
cp -f gtk-dark.css 	../Flat-Remix-GTK/gtk-3.0/gtk-dark.css

cp -f gtk-dark.css 	../Flat-Remix-GTK-Dark/gtk-3.0/gtk.css

cp -f gtk-darkest.css 	../Flat-Remix-GTK-Darkest/gtk-3.0/gtk.css

cp -f gtk-darker.css 	../Flat-Remix-GTK-Darker/gtk-3.0/gtk.css
cp -f gtk-dark.css 	../Flat-Remix-GTK-Darker/gtk-3.0/gtk-dark.css

if [ "$(ls -A $ASSETS_DIR)" ]
then
	rm $ASSETS_DIR/*
fi
../assets-renderer/gtk3/render-assets.sh

rm -rf ../Flat-Remix-GTK/gtk-3.0/assets
cp -rf $ASSETS_DIR ../Flat-Remix-GTK/gtk-3.0/assets

rm -rf ../Flat-Remix-GTK-Dark/gtk-3.0/assets
cp -rf $ASSETS_DIR ../Flat-Remix-GTK-Dark/gtk-3.0/assets

rm -rf ../Flat-Remix-GTK-Darkest/gtk-3.0/assets
cp -rf $ASSETS_DIR ../Flat-Remix-GTK-Darkest/gtk-3.0/assets

rm -rf ../Flat-Remix-GTK-Darker/gtk-3.0/assets
cp -rf $ASSETS_DIR ../Flat-Remix-GTK-Darker/gtk-3.0/assets


sudo rm -rf
sudo cp -R ../Flat-Remix-GTK* /usr/share/themes

gsettings set org.gnome.desktop.interface gtk-theme "Flat-Remix-GTK"
