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