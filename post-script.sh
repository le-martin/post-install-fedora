#!/bin/bash

sudo dnf -y update
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
echo "defaultyes=True" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install vim sddm git bspwm dconf-editor kitty rofi polybar sxhkd thunar picom nitrogen fontawesome-fonts fontawesome-fonts-web firefox arandr autorandr meslo-lg-fonts -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
git clone https://github.com/christitustech/fedora-titus
mkdir ~/.config
cp -r fedora-titus/dotfiles/* ~/.config/
cp fedora-titus/bg.jpg ~/.config/
cp fedora-titus/.* ~/
sudo dnf install ~/fedora-titus/rpm-packages/*.rpm -y

echo "Session=bspwm" | sudo tee -a /etc/sddm.conf > /dev/null

mkdir .fonts
cd .fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
unzip FiraCode.zip
