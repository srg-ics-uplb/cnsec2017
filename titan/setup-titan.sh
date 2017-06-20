#!/bin/bash
#by jachermocilla@gmail.com

#add repo for old PHP versions no longer supported in 16.04
sudo add-apt-repository ppa:ondrej/php
apt-get update
apt-get -y upgrade


#set the password for mysql server for non-interactive install
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

#install dvwa packages
apt-get install -y apache2 mysql-server php5.6 php5.6-mysql php5.6-gd php5.6-cli unzip


#install and configure dvwa
wget https://github.com/mbbderobles/php-sample/archive/master.zip -O /tmp/titan.zip
cd /var/www/html
rm index.html
unzip /tmp/titan.zip
mv php-sample-master/* .
rm -fr php-sample-master


sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/5.6/apache2/php.ini
echo "root" > .password
mysql --user=root --password="$(< .password)" -e "CREATE DATABASE cnsec;"
mysql --user=root --password="$(< .password)" dvwa < database.sql
rm .password
service apache2 restart








