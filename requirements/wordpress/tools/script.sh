#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

if [ ! -f ./wp-config.php  ]; then
    rm -rf *
    wp core download --allow-root

    sed -i "s/username_here/ZoktrFall/g" wp-config-sample.php
	sed -i "s/password_here/Xxx123/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/mydb/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php

    wp core install --url=aafrikya.42.fr/ --title=Mytitle --admin_user=Zoktr --admin_password=Xxx123 --admin_email=TestOper@gmail.com --skip-email --allow-root
    wp user create ZoktrFall zoktr@42.com --role=author --user_pass=Xxx456 --allow-root
    wp theme update --all --allow-root
    # wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

wp core update --allow-root
# wp redis enable --allow-root

/usr/sbin/php-fpm8.2 -F