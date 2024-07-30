#!/bin/sh

original_theme="$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d \')"
sed -i "s/Adwaita/${original_theme}/" uninstall.sh

mkdir -p ~/.config/gtk-4.0/
cp -r -f libadwaita/* uninstall.sh ~/.config/gtk-4.0/

mkdir -p ~/.themes/
cp -a $PWD ~/.themes/

gsettings set org.gnome.desktop.interface gtk-theme "$(basename $PWD)"
