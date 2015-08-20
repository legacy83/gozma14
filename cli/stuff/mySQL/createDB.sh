#!/bin/sh

###########################################################
# MySQL Create DB
###########################################################

db=$1
db_user=$1
db_pass="$1@secret"

echo "CREATE DATABASE IF NOT EXISTS $db;" | mysql -u root -proot@secret
echo "GRANT ALL PRIVILEGES ON $db.* TO $db_user@localhost IDENTIFIED BY '$db_pass';" | mysql -u root -proot@secret