#!/bin/bash

shopt -s globstar

TMP='/tmp/flat-remix-gtk'
ASSETS_DIR=../assets-renderer/gtk3/assets
VARIANTS=(DEFAULT Red Green Yellow)
VARIANT_COLORS=('#367bf0' '#d41919' '#17917a' '#ffd86e')
VARIANT_SELECTED_FONT_COLORS=('#ffffff' '#ffffff' '#ffffff' '#000000' )
DEFAULT_COLOR='#367bf0'


function generate_variant_template {
	variant="$1"
	variant_color="$2"
	for theme in variant-templates/*
	do
		basename=$(basename $theme)
		cp -a "$theme" "$TMP/${variant}${basename#Flat-Remix-GTK}"
	done
	sed "s/${DEFAULT_COLOR}/${variant_color}/gi" -i $(find "$TMP" -type f)
}

function generate_sass_files {(
	variant_color="$1"
	variant_selected_font_color="$2"
	cd sass;
	for scss in *.scss
	do
		echo "Generate ${scss}"
		echo "\$selected_bg_color: $variant_color; \$selected_fg_color: ${variant_selected_font_color};" | \
				cat - "$scss" | \
				scss --sourcemap=none -C -q -s "$TMP"/"$(basename ${scss%%.scss})".css
	done
)}

function copy_css_files {
	variant="$1"
	cp -f "$TMP/gtk.css" "$TMP/${variant}/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-solid.css" "$TMP/${variant}-Solid/gtk-3.0/gtk.css"

	cp -f "$TMP/gtk-dark.css" "$TMP/${variant}/gtk-3.0/gtk-dark.css"
	cp -f "$TMP/gtk-dark.css" "$TMP/${variant}-Dark/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-dark.css" "$TMP/${variant}-Darker/gtk-3.0/gtk-dark.css"
	cp -f "$TMP/gtk-dark-solid.css" "$TMP/${variant}-Solid/gtk-3.0/gtk-dark.css"
	cp -f "$TMP/gtk-dark-solid.css" "$TMP/${variant}-Dark-Solid/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-dark-solid.css" "$TMP/${variant}-Darker-Solid/gtk-3.0/gtk-dark.css"

	cp -f "$TMP/gtk-darker.css" "$TMP/${variant}-Darker/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-darker-solid.css" "$TMP/${variant}-Darker-Solid/gtk-3.0/gtk.css"

	cp -f "$TMP/gtk-darkest.css" "$TMP/${variant}-Darkest/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-darkest-solid.css" "$TMP/${variant}-Darkest-Solid/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-darkest-noBorder.css" "$TMP/${variant}-Darkest-NoBorder/gtk-3.0/gtk.css"
	cp -f "$TMP/gtk-darkest-solid-noBorder.css" "$TMP/${variant}-Darkest-Solid-NoBorder/gtk-3.0/gtk.css"
}

function generate_assets {
	rm -rf "$TMP"/assets-renderer
	variant="$1"
	variant_selected_font_color="$2"
	cp -rf assets-renderer "$TMP"/
	sed "s/${DEFAULT_COLOR}/${variant_color}/gi" -i $(find "$TMP/assets-renderer" -type f)
	"$TMP"/assets-renderer/gtk2/render-assets.sh
	"$TMP"/assets-renderer/gtk3/render-assets.sh
	"$TMP"/assets-renderer/metacity/render-assets.sh

	for theme in "$TMP/$variant"*
	do
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
		cp -f "$TMP"/assets-renderer/gtk2/menubar-toolbar/* "$theme"/gtk-2.0/menubar-toolbar/
		cp -f "$TMP"/assets-renderer/gtk3/assets/* "$theme"/gtk-3.0/assets/
	done
}


rm -rf "$TMP"
mkdir -p "$TMP"

for i in $(seq 0 $[${#VARIANTS[*]}-1])
do
	variant="${VARIANTS[$i]}"
	if [ "$variant" = 'DEFAULT' ];
		then variant='Flat-Remix-GTK';
		else variant="Flat-Remix-GTK-$variant"
	fi
	variant_color="${VARIANT_COLORS[$i]}"
	variant_selected_font_color="${VARIANT_SELECTED_FONT_COLORS[$i]}"

	generate_variant_template "$variant" "$variant_color"
	generate_sass_files "$variant_color" "$variant_selected_font_color"
	copy_css_files "$variant"
	[[ $1 != "--no-assets" ]] && generate_assets "$variant" "$variant_color"
done

rsync -a --delete "$TMP"/Flat-Remix* ..

