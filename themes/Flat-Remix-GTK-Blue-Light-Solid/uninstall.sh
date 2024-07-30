#!/bin/sh

theme=Flat-Remix-GTK-Blue-Light

rm -rf ~/.config/gtk-4.0/gtk.css \
       ~/.config/gtk-4.0/assets \
       ~/.config/gtk-4.0/uninstall.sh \
       ~/.themes/$theme/

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
