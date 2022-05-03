#!/bin/bash

#TODO: Install Meslo-fonts
dir=$(pwd)
sudo dnf -y update
# dnf optimizations
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
# enable rpm fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# install dependencies
sudo dnf install kitty neovim sddm git dconf-editor xclip rofi thunar picom google-roboto-fonts fontawesome-fonts fontawesome-fonts-web firefox arandr -y
sudo dnf install NetworkManager-wifi NetworkManager-tui network-manager-applet -y
sudo dnf install qt5-qtquickcontrols qt5-qtquickcontrols2 qt5-qtstyleplugins pip scrot blueman rofi-themes feh ImageMagick -y
sudo dnf install pipewire dnf-plugins-core ffmpeg zsh flameshot polkit-gnome gnome-keyring xbacklight xfce4-power-manager lxappearance pavucontrol -y
wget -qO- https://git.io/papirus-icon-theme-install | sh
# sddm enable
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# copy config files for awesomeWM
bash awesome-build.sh
bash picom.sh
git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/{*,.[^.]*} $HOME/.config/awesome; rm -rf awesome-copycats
#git clone -b awesome4.3-stable https://github.com/HikariKnight/material-awesome.git $HOME/.config/awesome
sudo cp -fdr awesomewm.desktop /usr/share/xsessions/awesomewm.desktop
# git clone https://github.com/lcpz/lain.git $HOME/.config/awesome/lain

# download fedora specific packages
git clone https://github.com/christitustech/fedora-titus
# install sddm theme
git clone https://github.com/keyitdev/sddm-astronaut-theme.git
mkdir -p $HOME/.config
#cp -r $dir/fedora-titus/dotconfig/* $HOME/.config/
cp $dir/fedora-titus/bg.jpg $HOME/.config/
sudo dnf install $dir/fedora-titus/rpm-packages/*.rpm -y
sudo pip install autorandr

sudo cp -fdr sddm-astronaut-theme /usr/share/sddm/themes/
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
sudo cp $HOME/post-install-fedora/sddm.conf /etc/sddm.conf
mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
wget "https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip"
unzip FiraCode.zip
unzip fad7939b-ubuntu-font-family-0.83.zip
unzip Ubuntu.zip
rm -rf *.zip
# configure rofi
#mkdir -p $HOME/.config/rofi
#cp $HOME/.config/awesome/theme/config.rasi $HOME/.config/rofi/config.rasi
#sed -i '/@import/c\@import "'$HOME'/.config/awesome/theme/sidebar.rasi"' $HOME/.config/rofi/config.rasi
# parity between qt and gtk applications
echo "XDG_CURRENT_DESKTOP=Unity" | sudo tee -a /etc/environment > /dev/null
echo "QT_QPA_PLATFORMTHEME=gtk2" | sudo tee -a /etc/environment > /dev/null
