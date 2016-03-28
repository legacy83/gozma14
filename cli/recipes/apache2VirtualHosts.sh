#!/bin/sh

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
# 301 Redirect
###########################################################

echo "
Options +FollowSymLinks
RewriteEngine on
RewriteCond %{HTTP_HOST} ^192.168.27.14.xip.io\$ [NC]
RewriteRule ^(.*)$ http://www.192.168.27.14.xip.io/\$1 [R=301,L]" > "/var/www/192.168.27.14.xip.io/public_html/.htaccess"