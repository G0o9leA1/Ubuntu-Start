#!/bin/bash

# Choose fastest APT servers
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i -e 's/http:\/\/us.archive/mirror:\/\/mirrors/' -e 's/\/ubuntu\//\/CN.txt/' /etc/apt/sources.list
sudo apt update

# Install common lib
sudo apt install build-essential curl git

# Install vim
sudo apt install vim

# Install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
sudo apt install /tmp/google-chrome-stable_current_amd64.deb


# Install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Install oh-my-zsh
sudo apt install zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "if [ -f ~/.shell_profile ]; then" >> ~/.bashrc
echo "    . ~/.shell_profile" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "if [ -f ~/.shell_profile ]; then" >> ~/.zshrc
echo "    . ~/.shell_profile" >> ~/.zshrc
echo "fi" >> ~/.zshrc

# Install htop
sudo apt install htop

# Install tmux
sudo apt install tmux

# Install Gnome-tweak
sudo apt install gnome-tweaks

# Java
sudo apt install openjdk-11-jre
sudo apt install openjdk-11-jdk
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.shell_profile
echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.shell_profile
