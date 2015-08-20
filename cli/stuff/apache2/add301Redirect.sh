
#!/bin/sh

###########################################################
# Add 301 Redirect
###########################################################

redirect_from="$1"
redirect_to="$2"

redirect_htaccess="
Options +FollowSymLinks
RewriteEngine on
RewriteCond %{HTTP_HOST} ^$redirect_from\$ [NC]
RewriteRule ^(.*)$ http://$redirect_to/\$1 [R=301,L]"

echo "$redirect_htaccess" > "/var/www/$redirect_from/public_html/.htaccess"