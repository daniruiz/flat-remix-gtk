#!/bin/bash

ASSETS_DIR=../assets-renderer/gtk3/assets

for i in gtk*.scss
do
	sass $i > ${i%%.scss}.css -q
done


cp -f gtk.css 		../Flat-Remix-GTK/gtk-3.0/gtk.css
cp -f gtk-dark.css 	../Flat-Remix-GTK/gtk-3.0/gtk-dark.css

cp -f gtk-dark.css 	../Flat-Remix-GTK-Dark/gtk-3.0/gtk.css

cp -f gtk-darkest.css 	../Flat-Remix-GTK-Darkest/gtk-3.0/gtk.css

cp -f gtk-darker.css 	../Flat-Remix-GTK-Darker/gtk-3.0/gtk.css
cp -f gtk-dark.css 	../Flat-Remix-GTK-Darker/gtk-3.0/gtk-dark.css


cp -f gtk-solid.css 		../Flat-Remix-GTK-Solid/gtk-3.0/gtk.css
cp -f gtk-dark-solid.css 	../Flat-Remix-GTK-Solid/gtk-3.0/gtk-dark.css

cp -f gtk-dark-solid.css 	../Flat-Remix-GTK-Dark-Solid/gtk-3.0/gtk.css

cp -f gtk-darkest-solid.css 	../Flat-Remix-GTK-Darkest-Solid/gtk-3.0/gtk.css

cp -f gtk-darker-solid.css 	../Flat-Remix-GTK-Darker-Solid/gtk-3.0/gtk.css
cp -f gtk-dark-solid.css 	../Flat-Remix-GTK-Darker-Solid/gtk-3.0/gtk-dark.css
