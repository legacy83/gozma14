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
gem install bourbon
gem install neat
gem install bitters
