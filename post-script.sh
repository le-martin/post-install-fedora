#!/bin/bash

#TODO: Install Meslo-fonts, autorandr
dir=$(pwd)
sudo dnf -y update
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install vim sddm git dconf-editor rofi thunar picom nitrogen fontawesome-fonts fontawesome-fonts-web firefox arandr NetworkManager-wifi NetworkManager-tui -y
sudo dnf install qt qt5-qtquickcontrols2-devel.x86_64 qt5-qtquickcontrols2.x86_64 pip -y
sudo dnf install lua libtermcap-devel ncurses-devel libevent-devel readline-devel gzip asciidoctor pipewire ffmpeg i3lock zsh -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
git clone https://github.com/christitustech/fedora-titus
git clone https://github.com/keyitdev/sddm-astronaut-theme.git
git clone https://github.com/awesomeWM/awesome.git
mkdir -p $HOME/.config
git clone https://github.com/Mofiqul/awesome-shell.git  $HOME/.config/awesome
#cp -r $dir/fedora-titus/dotconfig/* $HOME/.config/
cp $dir/fedora-titus/bg.jpg $HOME/.config/
cp $dir/fedora-titus/.* $HOME/
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

cd $dir/awesome
make package
sudo dnf install *.rpm -y
