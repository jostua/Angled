#!/bin/bash

echo
echo "Updating apt..."
apt-get update
apt-get autoclean -y

echo
echo "Installing additional software..."
apt-get install -y software-properties-common
apt-get install -y git zsh nginx php5

echo
echo "Setting up mysql..."
echo "mysql-server mysql-server/root_password password vagrant" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password vagrant" | debconf-set-selections
apt-get install -y mysql

echo
echo "Making sure Apache2 didn't sneak it's way in..."
apt-get purge -y apache*

add-apt-repository -y ppa:webupd8team/java
apt-get update

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

apt-get install -y oracle-java8-installer

#echo
#echo "Setting ulimits for root..."
#echo "root	soft	nofile	40000" >> /etc/security/limits.conf
#echo "root	hard	nofile	40000" >> /etc/security/limits.conf

echo
echo "Setting up node.js..."
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get install -y nodejs

#echo
#echo "Setting up Neo4j..."
#wget -O - http://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
#echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
#apt-get update
#apt-get install -y neo4j

#echo
#echo "Updating Neo4j Config..."
#sudo sed -i 's/#org\.neo4j\.server\.webserver\.address=0\.0\.0\.0/org.neo4j.server.webserver.address=0.0.0.0/' /etc/neo4j/neo4j-server.properties

#echo
#echo "Setting ulimits for neo4j..."
#echo "neo4j	soft	nofile	40000" >> /etc/security/limits.conf
#echo "neo4j	hard	nofile	40000" >> /etc/security/limits.conf

#echo
#echo "Setting pam requirements..."
#echo 'session required pam_limits.so' >> /etc/pam.d/su

#echo
#echo "Starting neo4j"
#/etc/init.d/neo4j-service start

echo
echo "Installing Oh-my-Zsh"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussel"/ZSH_THEME="mh"/g' ~/.zshrc
chsh -s /bin/zsh
