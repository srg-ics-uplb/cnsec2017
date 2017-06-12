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
rm index.html
tar xzvf /tmp/v1.9.tar.gz
cp -r DVWA-1.9/* .
rm -fr DVWA-1.9
sed -i 's/allow_url_include = Off/allow_url_include = On/g' /etc/php/5.6/apache2/php.ini
chmod -R 777 /var/www/html/hackable/uploads/
chmod -R 777 /var/www/html/external/phpids/0.6/lib/IDS/tmp/phpids_log.txt
echo "p@ssw0rd" > .password
mysql --user=root --password="$(< .password)" -e "CREATE DATABASE dvwa;"
mysql --user=root --password="$(< .password)" dvwa < /vagrant/dvwa-1.9-cnsec2017.sql
rm .password
service apache2 restart


#web app pen test tools
apt-get -y install libssl-dev libffi-dev libsqlite3-dev libxslt1-dev libyaml-dev libxml2-dev
apt-get install -y python2.7 python-pip

pip install pyClamd==0.3.15 PyGithub==1.21.0 GitPython==0.3.2.RC1 pybloomfiltermmap==0.3.14 esmre==0.3.1 phply==0.9.1 nltk==3.0.1 chardet==2.1.1 tblib==0.2.0 pdfminer==20140328 futures==2.1.5 pyOpenSSL==0.15.1 ndg-httpsclient==0.3.3 pyasn1==0.1.9 lxml==3.4.4 scapy-real==2.2.0-dev guess-language==0.2 cluster==1.1.1b3 msgpack-python==0.4.4 python-ntlm==1.0.1 halberd==0.2.4 darts.util.lru==0.5 Jinja2==2.7.3 vulndb==0.0.19 markdown==2.6.1 psutil==2.2.1 termcolor==1.1.0 mitmproxy==0.13 ruamel.ordereddict==0.4.8 Flask==0.10.1 PyYAML==3.12 tldextract==1.7.2

update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
cd /home/ubuntu
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
git clone --depth 1 https://github.com/andresriancho/w3af.git w3af-dev

chown -R ubuntu.ubuntu sqlmap-dev
chown -R ubuntu.ubuntu w3af-dev






