#!/usr/bin/env bash
# -*- coding: UTF-8 -*-
## Helper script to sync Adwaita from upstream to a destination folder
## usage:
##
##      adwaita-sync.sh --destination <path> [--assets]
##
## options:
##    -d, --destination <path>    Destination folder - mandatory
##    -a, --assets                Sync assets file - optional
# CLInt GENERATED_CODE: start

# No-arguments is not allowed
[ $# -eq 0 ] && sed -ne 's/^## \(.*\)/\1/p' $0 && exit 1

# Converting long-options into short ones
for arg in "$@"; do
  shift
  case "$arg" in
"--destination") set -- "$@" "-d";;
"--assets") set -- "$@" "-a";;
  *) set -- "$@" "$arg"
  esac
done

function print_illegal() {
    echo Unexpected flag in command line \"$@\"
}

# Parsing flags and arguments
while getopts 'had:' OPT; do
    case $OPT in
        h) sed -ne 's/^## \(.*\)/\1/p' $0
           exit 1 ;;
        a) _assets=1 ;;
        d) _destination=$OPTARG ;;
        \?) print_illegal $@ >&2;
            echo "---"
            sed -ne 's/^## \(.*\)/\1/p' $0
            exit 1
            ;;
    esac
done
# CLInt  GENERATED_CODE: end

wget_check=`which wget | wc -l`
[ $wget_check == 0 ] && echo "install wget" && exit 1

root=https://gitlab.gnome.org/GNOME/gtk/raw/master/gtk/theme/Adwaita

[ ! -d ${_destination} ] && echo ${_destination} folder does not exists && exit 1

files=(assets.svg
    assets.txt
    _colors-public.scss
    _colors.scss
    _common.scss
    _drawing.scss
    gtk-contained.css
    gtk-contained-dark.css
    gtk-contained-dark.scss
    gtk-contained.scss
    gtk.css
    gtk-dark.css
    README)

assets=(bullet@2-symbolic.symbolic.png
    bullet-symbolic.svg
    bullet-symbolic.symbolic.png
    check@2-symbolic.symbolic.png
    check-symbolic.svg
    check-symbolic.symbolic.png
    dash@2-symbolic.symbolic.png
    dash-symbolic.svg
    dash-symbolic.symbolic.png
    slider-horz-scale-has-marks-above@2.png
    slider-horz-scale-has-marks-above-active@2.png
    slider-horz-scale-has-marks-above-active-dark@2.png
    slider-horz-scale-has-marks-above-active-dark.png
    slider-horz-scale-has-marks-above-active.png
    slider-horz-scale-has-marks-above-backdrop@2.png
    slider-horz-scale-has-marks-above-backdrop-dark@2.png
    slider-horz-scale-has-marks-above-backdrop-dark.png
    slider-horz-scale-has-marks-above-backdrop-insensitive@2.png
    slider-horz-scale-has-marks-above-backdrop-insensitive-dark@2.png
    slider-horz-scale-has-marks-above-backdrop-insensitive-dark.png
    slider-horz-scale-has-marks-above-backdrop-insensitive.png
    slider-horz-scale-has-marks-above-backdrop.png
    slider-horz-scale-has-marks-above-dark@2.png
    slider-horz-scale-has-marks-above-dark.png
    slider-horz-scale-has-marks-above-hover@2.png
    slider-horz-scale-has-marks-above-hover-dark@2.png
    slider-horz-scale-has-marks-above-hover-dark.png
    slider-horz-scale-has-marks-above-hover.png
    slider-horz-scale-has-marks-above-insensitive@2.png
    slider-horz-scale-has-marks-above-insensitive-dark@2.png
    slider-horz-scale-has-marks-above-insensitive-dark.png
    slider-horz-scale-has-marks-above-insensitive.png
    slider-horz-scale-has-marks-above.png
    slider-horz-scale-has-marks-below@2.png
    slider-horz-scale-has-marks-below-active@2.png
    slider-horz-scale-has-marks-below-active-dark@2.png
    slider-horz-scale-has-marks-below-active-dark.png
    slider-horz-scale-has-marks-below-active.png
    slider-horz-scale-has-marks-below-backdrop@2.png
    slider-horz-scale-has-marks-below-backdrop-dark@2.png
    slider-horz-scale-has-marks-below-backdrop-dark.png
    slider-horz-scale-has-marks-below-backdrop-insensitive@2.png
    slider-horz-scale-has-marks-below-backdrop-insensitive-dark@2.png
    slider-horz-scale-has-marks-below-backdrop-insensitive-dark.png
    slider-horz-scale-has-marks-below-backdrop-insensitive.png
    slider-horz-scale-has-marks-below-backdrop.png
    slider-horz-scale-has-marks-below-dark@2.png
    slider-horz-scale-has-marks-below-dark.png
    slider-horz-scale-has-marks-below-hover@2.png
    slider-horz-scale-has-marks-below-hover-dark@2.png
    slider-horz-scale-has-marks-below-hover-dark.png
    slider-horz-scale-has-marks-below-hover.png
    slider-horz-scale-has-marks-below-insensitive@2.png
    slider-horz-scale-has-marks-below-insensitive-dark@2.png
    slider-horz-scale-has-marks-below-insensitive-dark.png
    slider-horz-scale-has-marks-below-insensitive.png
    slider-horz-scale-has-marks-below.png)

set -e
for i in ${files[@]}; do
    wget ${root}/${i} -O ${_destination}/${i}
done

if [ ! -z $_assets ]; then
    for i in ${assets[@]}; do
        wget ${root}/assets/${i} -O ${_destination}/assets/${i}
    done
fi
