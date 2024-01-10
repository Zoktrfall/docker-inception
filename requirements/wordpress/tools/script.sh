#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

if [ ! -f ./wp-config.php  ]; then
    rm -rf *
    wp core download --allow-root

    sed -i "s/username_here/ZoktrFall/g" wp-config-sample.php
	sed -i "s/password_here/Xxx123/g" wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wp-config-sample.php
	sed -i "s/database_name_here/MyDB/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
    rm -rf wp-config-sample.php

    wp core install --url=aafrikya.42.fr/ --title=Mytitle --admin_user=Zoktr --admin_password=Xxx123 --admin_email=TestOper@gmail.com --skip-email --allow-root
    wp user create ZoktrFall zoktr@42.com --role=author --user_pass=Xxx456 --allow-root
    wp theme install astra --activate --allow-root
    # wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
fi

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf
mkdir -p /run/php

# wp redis enable --allow-root

/usr/sbin/php-fpm8.2 -F