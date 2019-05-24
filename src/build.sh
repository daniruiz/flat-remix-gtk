#!/bin/bash

TMP='/tmp/flat-remix-gtk'
VARIANTS=(Blue Red Green Yellow)
VARIANT_COLORS=('#367bf0' '#d41919' '#17917a' '#ffd86e')
VARIANT_SELECTED_FONT_COLORS=('white' 'white' 'white' 'black' )
DEFAULT_COLOR='#367bf0'


function generate_variant_template {
	variant="$1"
	variant_color="$2"
	for theme in variant-templates/*
	do
		theme_basename="$(basename "$theme")"
		variant_dir="$TMP/${variant}${theme_basename#Flat-Remix-GTK}"
		cp -a "$theme" "$variant_dir"
		sed -s "s/Flat-Remix-GTK/${variant}/g" -i "$variant_dir/index.theme"
		find "$variant_dir" -type f -exec sed "s/${DEFAULT_COLOR}/${variant_color}/gi" -i {} \;
		case "$theme_basename" in
			*Darkest*)
				cp gtk-3.0-thumbnails/thumbnail-darkest-"${variant##Flat-Remix-GTK-}".png "$variant_dir"/gtk-3.0/thumbnail.png
				;;
			*Dark|*Dark-*)
				cp gtk-3.0-thumbnails/thumbnail-dark-"${variant##Flat-Remix-GTK-}".png "$variant_dir"/gtk-3.0/thumbnail.png
				;;
			*)
				cp gtk-3.0-thumbnails/thumbnail-"${variant##Flat-Remix-GTK-}".png "$variant_dir"/gtk-3.0/thumbnail.png
				;;
        esac
	done
}

function generate_css_files { (
	variant="$1"
	variant_color="$2"
	variant_selected_font_color="$3"
	mkdir -p "$TMP/css/$variant"
	cd sass || return
	for scss in *.scss
	do
		echo -e "Generate $variant \t $scss"
		echo "\$selected_bg_color: $variant_color; \$selected_fg_color: ${variant_selected_font_color};" | \
				cat - "$scss" | \
				scss --sourcemap=none -C -q -s "$TMP/css/$variant/$(basename "${scss%%.scss}")".css
	done
) }

function copy_css_files {
	variant="$1"
	cp "$TMP/css/${variant}/gtk.css" "$TMP/${variant}/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-solid.css" "$TMP/${variant}-Solid/gtk-3.0/gtk.css"

	cp "$TMP/css/${variant}/gtk-dark.css" "$TMP/${variant}/gtk-3.0/gtk-dark.css"
	cp "$TMP/css/${variant}/gtk-dark.css" "$TMP/${variant}-Dark/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-dark.css" "$TMP/${variant}-Darker/gtk-3.0/gtk-dark.css"
	cp "$TMP/css/${variant}/gtk-dark-solid.css" "$TMP/${variant}-Solid/gtk-3.0/gtk-dark.css"
	cp "$TMP/css/${variant}/gtk-dark-solid.css" "$TMP/${variant}-Dark-Solid/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-dark-solid.css" "$TMP/${variant}-Darker-Solid/gtk-3.0/gtk-dark.css"

	cp "$TMP/css/${variant}/gtk-darker.css" "$TMP/${variant}-Darker/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-darker-solid.css" "$TMP/${variant}-Darker-Solid/gtk-3.0/gtk.css"

	cp "$TMP/css/${variant}/gtk-darkest.css" "$TMP/${variant}-Darkest/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-darkest-solid.css" "$TMP/${variant}-Darkest-Solid/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-darkest-noBorder.css" "$TMP/${variant}-Darkest-NoBorder/gtk-3.0/gtk.css"
	cp "$TMP/css/${variant}/gtk-darkest-solid-noBorder.css" "$TMP/${variant}-Darkest-Solid-NoBorder/gtk-3.0/gtk.css"
}

function generate_assets {
	variant="$1"
	variant_color="$2"
	mkdir "$TMP/assets-renderer"
	cp -r assets-renderer "$TMP/assets-renderer/$variant"
	find "$TMP/assets-renderer/$variant" -type f -exec sed "s/${DEFAULT_COLOR}/${variant_color}/gi" -i {} \;
	"$TMP"/assets-renderer/"$variant"/gtk2/render-assets.sh
	"$TMP"/assets-renderer/"$variant"/gtk3/render-assets.sh
	"$TMP"/assets-renderer/"$variant"/metacity/render-assets.sh

	for theme in "$TMP/$variant"*
	do
		case "$theme" in
			*Darkest*)
				cp "$TMP"/assets-renderer/"$variant"/gtk2/assets-darkest/* "$theme"/gtk-2.0/assets/
				cp "$TMP"/assets-renderer/"$variant"/metacity/metacity-darkest/* "$theme"/metacity-1/
				;;
			*Dark|*Dark-*)
				cp "$TMP"/assets-renderer/"$variant"/gtk2/assets-dark/* "$theme"/gtk-2.0/assets/
				cp "$TMP"/assets-renderer/"$variant"/metacity/metacity-dark/* "$theme"/metacity-1/
				;;
			*Darker|*Darker-*)
				cp "$TMP"/assets-renderer/"$variant"/gtk2/assets/* "$theme"/gtk-2.0/assets/
				cp "$TMP"/assets-renderer/"$variant"/metacity/metacity-darkest/* "$theme"/metacity-1/
				;;
			*)
				cp "$TMP"/assets-renderer/"$variant"/gtk2/assets/* "$theme"/gtk-2.0/assets/
				cp "$TMP"/assets-renderer/"$variant"/metacity/metacity/* "$theme"/metacity-1/
				;;
		esac
		cp "$TMP"/assets-renderer/"$variant"/gtk2/menubar-toolbar/* "$theme"/gtk-2.0/menubar-toolbar/
		cp "$TMP"/assets-renderer/"$variant"/gtk3/assets/* "$theme"/gtk-3.0/assets/
	done
}

function generate_variant {
	variant="$2"
	variant_color="$3"
	variant_selected_font_color="$4"

	generate_variant_template "$variant" "$variant_color"
	generate_css_files "$variant" "$variant_color" "$variant_selected_font_color"
	copy_css_files "$variant"
	[[ $1 != "--no-assets" ]] && generate_assets "$variant" "$variant_color"
	cp -a "$TMP/$variant"* ..
}


rm -rf "$TMP"
mkdir -p "$TMP"

for i in $(seq 0 $((${#VARIANTS[*]}-1)))
do
	variant="Flat-Remix-GTK-${VARIANTS[$i]}"
	variant_color="${VARIANT_COLORS[$i]}"
	variant_selected_font_color="${VARIANT_SELECTED_FONT_COLORS[$i]}"
	generate_variant "$1" "$variant" "$variant_color" "$variant_selected_font_color" &
done

