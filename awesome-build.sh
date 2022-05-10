!#/bin/bash

sudo dnf install cmake cmake-fedora lua-devel lua-lgi xorg-x11-proto-devel libxcb-devel xcb-util xcb-util-cursor xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm-devel xcb-util-keysyms-devel cairo-devel pango-devel glib-devel libX11-devel libX11-xcb libxkbcommon-x11-devel cairo-gobject gobject-introspection gdk-pixbuf2-devel ImageMagick-devel libxdg-basedir-devel startup-notification-devel libxcb-devel xcb-util-cursor-devel xcb-util-wm-devel -y

git clone https://github.com/awesomeWM/awesome.git
cd awesome
make package
sudo dnf install build/*.rpm -y
