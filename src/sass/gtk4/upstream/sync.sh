#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

VERSION=4.6.0

echo
printf " $YELLOW[ i ]$RESET Upstream version $VERSION\n"
echo

while read file;
do
	echo
	printf " $GREEN[ * ]$RESET Downloading file $file\n"
	wget https://gitlab.gnome.org/GNOME/gtk/-/raw/$VERSION/gtk/theme/Default/$file --timestamping --quiet

	if [ -f $file.patch ]
	then
		printf " $YELLOW[ ~ ]$RESET Apply patch\n"
		patch $file $file.patch --quiet
	fi
done <<- EOF
	_colors.scss
	_common.scss
	_drawing.scss
	_colors-public.scss
EOF

