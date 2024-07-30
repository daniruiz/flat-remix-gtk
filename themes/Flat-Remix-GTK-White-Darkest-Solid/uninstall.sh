#!/bin/sh

theme=Flat-Remix-GTK-White-Darkest

rm -rf ~/.config/gtk-4.0/gtk.css \
       ~/.config/gtk-4.0/assets \
       ~/.themes/$theme/

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
