#!/bin/sh

###########################################################
# Apache2 Add Virtual Host
###########################################################

vhost=$1

if [ ! -e "/etc/apache2/sites-available/$vhost" ]; then
    mkdir -p "/var/www/$vhost/public_html"
    mkdir -p "/var/www/$vhost/logs"
fi

vhost_conf="<VirtualHost *:80>
  ServerName $vhost
  DocumentRoot /var/www/$vhost/public_html/
  <Directory /var/www/$vhost/public_html/>
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>
  ErrorLog /var/www/$vhost/logs/error.log
  CustomLog /var/www/$vhost/logs/access.log combined
</VirtualHost>"

echo "$vhost_conf" > "/etc/apache2/sites-available/$vhost.conf"
a2ensite "$vhost.conf"