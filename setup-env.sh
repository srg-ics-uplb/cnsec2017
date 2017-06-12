#!/bin/bash
#by jachermocilla@gmail.com

#add repo for old PHP versions no longer supported in 16.04
sudo add-apt-repository ppa:ondrej/php
apt-get update
apt-get -y upgrade


#set the password for mysql server for non-interactive install
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'

#install dvwa packages
apt-get install -y apache2 mysql-server php5.6 php5.6-mysql php5.6-gd php5.6-cli


#install dev tools
apt-get install -y build-essential nasm

#install and configure dvwa
wget https://github.com/ethicalhack3r/DVWA/archive/v1.9.tar.gz -O /tmp/v1.9.tar.gz
cd /var/www/html
tar xzvf /tmp/v1.9.tar.gz
mv DVWA-1.9 dvwa
sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/5.6/apache2/php.ini
chmod -R 777 /var/www/html/dvwa/hackable/uploads/
chmod -R 777 /var/www/html/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
echo "p@ssw0rd" > .password
mysql --user=root --password="$(< .password)" -e "CREATE DATABASE dvwa;"
mysql --user=root --password="$(< .password)" dvwa < /vagrant/dvwa-1.9-cnsec2017.sql
rm .password
service apache2 restart


