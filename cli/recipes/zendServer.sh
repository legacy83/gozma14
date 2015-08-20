#!/bin/sh

###########################################################
# ZendServer Environment
###########################################################

echo "deb http://repos.zend.com/zend-server/8.5/deb server non-free" > /etc/apt/sources.list.d/zendServer.list
echo "deb http://repos.zend.com/zend-server/8.5/deb_apache2.4 server non-free" >> /etc/apt/sources.list.d/zendServer.list
wget http://repos.zend.com/zend.key -O- |apt-key add -

apt-get update
apt-get -y install zend-server-php-5.6

echo 'export PATH=$PATH:/usr/local/zend/bin' > /etc/profile.d/zendServer.sh
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/zend/lib' >> /etc/profile.d/zendServer.sh

###########################################################
# NodeJS Environment
###########################################################

apt-get -y install nodejs
apt-get -y install nodejs-legacy
apt-get -y install npm

npm install -g bower
npm install -g gulp grunt-cli

###########################################################
# MySQL
###########################################################

MYSQL_ROOT_PASS='root@secret'

echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASS" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASS" | debconf-set-selections
apt-get -y install mysql-server

###########################################################
# PostgreSQL
###########################################################

apt-get -y install postgresql postgresql-contrib

###########################################################
# COMPOSER
###########################################################

if [ ! -e '/usr/local/bin/composer' ]; then
    curl -sS https://getcomposer.org/installer | /usr/local/zend/bin/php
    mv composer.phar /usr/local/bin/composer
fi

/usr/local/zend/bin/php /usr/local/bin/composer self-update
