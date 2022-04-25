#!/bin/bash

#TODO: Install Meslo-fonts, autorandr

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
cp -r /home/$USER/fedora-titus/dotfiles/* ~/.config/
cp /home/$USER/fedora-titus/bg.jpg /home/$USER/.config/
cp /home/$USER/fedora-titus/.* /home/$USER/
sudo dnf install /home/$USER/fedora-titus/rpm-packages/*.rpm -y

sudo cp /home/$USER/post-install-fedora/sddm.conf /etc/sddm.conf
mkdir -p /home/$USER/.fonts
cd /home/$USER/.fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
unzip FiraCode.zip
