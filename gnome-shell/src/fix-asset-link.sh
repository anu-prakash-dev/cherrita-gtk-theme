#!/bin/sh
name="$1"
themedir="$MESON_INSTALL_DESTDIR_PREFIX/share/themes/$name"
builddir="$MESON_BUILD_ROOT/shtmp"
mkdir -p $builddir
find $themedir/gnome-shell -name '*.css' | while read css; do
    sed "s#resource:///org/gnome/shell/theme/##g" $css > "$builddir/${css##*/}"
    mv $builddir/${css##*/} $css
done
