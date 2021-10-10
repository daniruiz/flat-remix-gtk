#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

VERSION=1.2.3

echo
printf " $YELLOW[ i ]$RESET Upstream version $VERSION\n"
echo

while read file;
do
	echo
	printf " $GREEN[ * ]$RESET Downloading file $file\n"
	wget https://gitlab.gnome.org/GNOME/libhandy/raw/$VERSION/src/themes/$file --timestamping --quiet
done <<- EOF
	_definitions.scss
	_shared-base.scss
	_Adwaita-base.scss
	_fallback-base.scss
EOF
echo

ln -rsfv ../_drawing.scss
