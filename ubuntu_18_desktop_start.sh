#!/bin/bash

# script will terminate when error occurs
set -e

# Using apt mirror protocol
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# CN apt mirror source: https://oss.link/config/apt-mirrors.txt
# Reference: https://mritd.me/2019/03/19/how-to-set-multiple-apt-mirrors-for-ubuntu/
sudo sed -i -e 's/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/oss.link\/config\/apt-mirrors.txt/' -e 's/http:\/\/us.archive.ubuntu.com\/ubuntu/mirror:\/\/oss.link\/config\/apt-mirrors.txt/' -e 's/http:\/\/security.ubuntu.com\/ubuntu/mirror:\/\/oss.link\/config\/apt-mirrors.txt/' /etc/apt/sources.list

# US official mirror source: http://mirrors.ubuntu.com/mirrors.txt
# Reference: https://linuxconfig.org/how-to-select-the-fastest-apt-mirror-on-ubuntu-linux
# $ sudo sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/mirrors.txt/' /etc/apt/sources.list

sudo apt update
sudo apt upgrade -y

# Install common lib
sudo apt install build-essential curl git -y

# Install vim
sudo apt install vim -y

# Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
sudo apt install /tmp/google-chrome-stable_current_amd64.deb
rm -r /tmp/google-chrome-stable_current_amd64.deb


# Install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Install oh-my-zsh
sudo apt install zsh -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /bin/zsh
cd && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && echo "source ${PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Create shared shell profile
echo "if [ -f ~/.shell_profile ]; then" >> ~/.bashrc
echo "    . ~/.shell_profile" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "if [ -f ~/.shell_profile ]; then" >> ~/.zshrc
echo "    . ~/.shell_profile" >> ~/.zshrc
echo "fi" >> ~/.zshrc

# Install htop
sudo apt install htop -y

# Install tmux
sudo apt install tmux -y

# Install Gnome-tweak
sudo apt install gnome-tweaks -y

# Java
sudo apt install openjdk-11-jre -y
sudo apt install openjdk-11-jdk -y
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.shell_profile
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.shell_profile
