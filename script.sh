#!/bin/bash

echo
echo "Updating apt..."
apt-get update
apt-get autoclean -y
apt-get install -y zsh

echo
echo "Installing additional software..."
apt-get install -y software-properties-common

echo
echo "Purging any apache installs that made it in..."
apt-get purge -y apache*

echo
echo "Installing nginx..."
apt-get install -y nginx

echo
echo "Installing git, zsh and php5..."
apt-get install -y git zsh php5 apache2-

echo
echo "Setting up mysql..."
echo "mysql-server mysql-server/root_password password vagrant" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections
apt-get install -y mysql

echo
echo "Making sure Apache2 didn't sneak it's way back in..."
apt-get purge -y apache*
apt-get update
apt-get autoclean -y

echo
echo "Setting up node.js..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

echo
echo "Installing Oh-my-Zsh from /vagrant_data/oh-my-zsh/"
#git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
#cp /home/vagrant/.zshrc /home/vagrant/.zshrc.orig
#cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
#sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="mh"/g' /home/vagrant/.zshrc

cp /vagrant_data/zshrc.zsh-template /home/vagrant/.zshrc

chsh -s /bin/zsh vagrant
