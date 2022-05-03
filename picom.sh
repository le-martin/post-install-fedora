#!/bin/bash

sudo dnf install dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel mesa-libGL-devel meson pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel -y

git clone https://github.com/yshui/picom.git

cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build install

