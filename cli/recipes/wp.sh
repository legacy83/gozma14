#!/bin/sh

###########################################################
# NodeJS Environment
###########################################################

apt-get -y install nodejs
apt-get -y install nodejs-legacy
apt-get -y install npm

###########################################################
# FrontEnd Stuff
###########################################################

npm install -g bower
npm install -g gulp grunt-cli
npm install -g less
gem install sass

###########################################################
# WP I18N Tools
###########################################################

if [ ! -d '/opt/wp-i18n-tools' ]; then
    svn checkout http://i18n.svn.wordpress.org/tools/trunk/ /opt/wp-i18n-tools
fi

###########################################################
# 192.168.27.14.xip.io Virtual Host
###########################################################

if [ ! -e "/etc/apache2/sites-available/192.168.27.14.xip.io" ]; then
    mkdir -p "/var/www/192.168.27.14.xip.io/public_html"
    mkdir -p "/var/www/192.168.27.14.xip.io/logs"
fi

echo "
<VirtualHost *:80>

  ServerName 192.168.27.14.xip.io
  DocumentRoot /var/www/192.168.27.14.xip.io/public_html/

  <Directory /var/www/192.168.27.14.xip.io/public_html/>
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>

  ErrorLog /var/www/192.168.27.14.xip.io/logs/error.log
  CustomLog /var/www/192.168.27.14.xip.io/logs/access.log combined

</VirtualHost>" > "/etc/apache2/sites-available/192.168.27.14.xip.io.conf"
a2ensite "192.168.27.14.xip.io.conf"

echo "
Options +FollowSymLinks
RewriteEngine on
RewriteCond %{HTTP_HOST} ^192.168.27.14.xip.io\$ [NC]
RewriteRule ^(.*)$ http://www.192.168.27.14.xip.io/\$1 [R=301,L]" > "/var/www/192.168.27.14.xip.io/public_html/.htaccess"

###########################################################
# www.192.168.27.14.xip.io Virtual Host
###########################################################

if [ ! -e "/etc/apache2/sites-available/www.192.168.27.14.xip.io" ]; then
    mkdir -p "/var/www/www.192.168.27.14.xip.io/public_html"
    mkdir -p "/var/www/www.192.168.27.14.xip.io/logs"
fi

echo "<VirtualHost *:80>

  ServerName www.192.168.27.14.xip.io
  DocumentRoot /var/www/www.192.168.27.14.xip.io/public_html/

  <Directory /var/www/www.192.168.27.14.xip.io/public_html/>
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>

  ErrorLog /var/www/www.192.168.27.14.xip.io/logs/error.log
  CustomLog /var/www/www.192.168.27.14.xip.io/logs/access.log combined
  
</VirtualHost>" > "/etc/apache2/sites-available/www.192.168.27.14.xip.io.conf"
a2ensite "www.192.168.27.14.xip.io.conf"

###########################################################
# Apache2 Under Vagrant
###########################################################

sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

chown -R vagrant:vagrant /var/lock/apache2
chown -R vagrant:vagrant /var/log/apache2
chown -R vagrant:vagrant /var/www

###########################################################
# Apache2 Restart
###########################################################

service apache2 restart