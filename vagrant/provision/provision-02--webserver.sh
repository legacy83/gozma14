#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

webserver_install() {
  apt-get install -y \
    apache2 php5 \
    libapache2-mod-php5 \
    php5-cli php5-common php5-dev \
    php5-pgsql php5-sqlite php5-gd \
    php5-curl php5-memcached \
    php5-imap php5-mysqlnd php5-intl \
    php5-xmlrpc php5-xsl php5-imagick \
    php5-mcrypt php-apc php-pear
}

webserver_setup() {
  local DOMAIN='gozma14.local'
  local APACHE_LOG_DIR='/var/log/apache2'

  echo "<VirtualHost *:80>
    ServerName ${DOMAIN}
    DocumentRoot /var/www/html
    AllowEncodedSlashes On
    <Directory /var/www/html>
      Options +Indexes +FollowSymLinks
    	DirectoryIndex index.php index.html
    	Order allow,deny
    	Allow from all
    	AllowOverride All
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
  </VirtualHost>" > /etc/apache2/sites-available/000-default.conf

  echo "ServerName localhost" > /etc/apache2/conf.d/name

  a2enmod expires
  a2enmod headers
  a2enmod include
  a2enmod rewrite
}

webserver_ownership() {
  sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
  sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

  chown -R vagrant:vagrant /var/lock/apache2
  chown -R vagrant:vagrant /var/log/apache2
  chown -R vagrant:vagrant /var/www
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive

webserver_install
webserver_setup
webserver_ownership

# Restart service
service apache2 restart
