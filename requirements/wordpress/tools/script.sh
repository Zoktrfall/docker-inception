#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

chmod -R 755 /var/www/html
chown -R www-data:www-data /var/www/html

if [ ! -f ./wp-config.php  ]; then
    rm -rf *
    wp core download --allow-root

    sed -i "s/username_here/$DB_User/g" wp-config-sample.php
	sed -i "s/password_here/$DB_Pwd/g" wp-config-sample.php
	sed -i "s/localhost/$LH/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_Name/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    rm -rf wp-config-sample.php

    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
    wp theme update --all --allow-root

    find /var/www/html/wp-content -type d -exec chmod 755 {} \;
    find /var/www/html/wp-content -type f -exec chmod 644 {} \;
    chown -R www-data:www-data /var/www/html/wp-content
    chmod 600 /var/www/html/wp-config.php
    chown www-data:www-data /var/www/html/wp-config.php

    wp plugin install redis-cache --activate --allow-root

    wp config set WP_REDIS_HOST $REDIS_HOSTNAME --allow-root
    wp config set WP_REDIS_PORT $REDIS_PORT --raw --allow-root
    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
    wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
    wp config set WP_REDIS_CLIENT phpredis --allow-root

    wp redis enable --allow-root
    wp plugin update --all --allow-root
fi

sleep 10
wp core update --allow-root

/usr/sbin/php-fpm8.2 -F