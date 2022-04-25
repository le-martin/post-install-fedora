#!/bin/bash

#TODO: Install Meslo-fonts, autorandr
dir=$(pwd)
sudo dnf -y update
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "fastestmirror=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install vim sddm git bspwm dconf-editor kitty rofi polybar sxhkd thunar picom nitrogen fontawesome-fonts fontawesome-fonts-web firefox arandr -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
git clone https://github.com/christitustech/fedora-titus
mkdir -p /home/$USER/.config
cp -r $dir/fedora-titus/dotconfig/* $HOME/.config/
cp $dir/fedora-titus/bg.jpg $HOME/.config/
cp $dir/fedora-titus/.* $HOME/
sudo dnf install $dir/fedora-titus/rpm-packages/*.rpm -y

sudo cp $HOME/post-install-fedora/sddm.conf /etc/sddm.conf
mkdir -p $HOME/.fonts
cd $HOME/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
unzip FiraCode.zip
