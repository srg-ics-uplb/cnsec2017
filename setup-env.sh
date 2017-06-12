#!/bin/bash

sudo add-apt-repository ppa:ondrej/php
apt-get update

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'
apt-get install -y apache2 mysql-server php5.6 php5.6-mysql php5.6-gd php5.6-cli

wget https://github.com/ethicalhack3r/DVWA/archive/v1.9.tar.gz -O /tmp/v1.9.tar.gz

cd /var/www/html
tar xzvf /tmp/v1.9.tar.gz
mv DVWA-1.9 dvwa

sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/5.6/apache2/php.ini


chmod -R 777 /var/www/html/dvwa/hackable/uploads/
chmod -R 777 /var/www/html/dvwa/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
 

service apache2 restart


