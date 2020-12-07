#!/bin/sh
themedir="$MESON_INSTALL_DESTDIR_PREFIX/$prefix/$1/$2"
mkdir -p "$themedir-dark/gtk-3.0"
ln -sf "$themedir/gtk-3.0/gtk-dark.css"  "$themedir-dark/gtk-3.0/gtk.css"
ln -sf "$themedir/gtk-3.0/gtk.gresource" "$themedir-dark/gtk-3.0/gtk.gresource"
