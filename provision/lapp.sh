#!/bin/sh
# Gozma LAPP Bash

###########################################################
# Apache2
###########################################################

#apt-get -y install apache2

#echo "ServerName localhost" > /etc/apache2/conf.d/name
#a2enmod rewrite

###########################################################
# PostgreSQL
###########################################################

#apt-get -y install postgresql postgresql-contrib

###########################################################
# PHP 5
###########################################################

#apt-get -y install php5 libapache2-mod-php5
#apt-get -y install php5-mysql php5-pgsql
#apt-get -y install php5-memcache
#apt-get -y install php5-imagick php5-mcrypt php5-imap php5-curl php-pear php5-gd

###########################################################
# COMPOSER
###########################################################

#if [ ! -e '/usr/local/bin/composer' ]; then
#    curl -sS https://getcomposer.org/installer | php
#    mv composer.phar /usr/local/bin/composer
#fi

#composer self-update