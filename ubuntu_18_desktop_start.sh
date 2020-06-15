#!/bin/bash

set -e

# Using apt mirror protocol
# CN apt source: https://oss.link/config/apt-mirrors.txt
# Reference: https://mritd.me/2019/03/19/how-to-set-multiple-apt-mirrors-for-ubuntu/
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i -e 's/http:\/\/us.archive.ubuntu.com\/ubuntu\//mirror:\/\/oss.link\/config\/apt-mirrors.txt/' -e 's/http:\/\/us.archive.ubuntu.com\/ubuntu/mirror:\/\/oss.link\/config\/apt-mirrors.txt/' -e 's/http:\/\/security.ubuntu.com\/ubuntu/mirror:\/\/oss.link\/config\/apt-mirrors.txt/' /etc/apt/sources.list
sudo apt update

# Install common lib
sudo apt install build-essential curl git -y

# Install vim
sudo apt install vim -y

# Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
sudo apt install /tmp/google-chrome-stable_current_amd64.deb


# Install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Install oh-my-zsh
sudo apt install zsh -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cd && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

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
