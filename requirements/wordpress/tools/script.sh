#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html
sleep 10

if [ ! -f ./wp-config.php  ]; then
    rm -rf *
    wp core download --allow-root

    sed -i "s/username_here/$DB_User/g" wp-config-sample.php
	sed -i "s/password_here/$DB_Pwd/g" wp-config-sample.php
	sed -i "s/localhost/$LH/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_Name/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php

    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme update --all --allow-root
    # wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

wp core update --allow-root
# wp redis enable --allow-root

/usr/sbin/php-fpm8.2 -F