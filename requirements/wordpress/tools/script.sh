#!/bin/bash



# create directory to use in nginx container later and also to setup the wordpress conf
mkdir -p /var/www/
mkdir -p /var/www/html

cd /var/www/html


rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

if [ -f /wp-config.php ]; then
    mv /wp-config.php /var/www/html/wp-config.php
fi

sed -i -r "s/db1/lol1/1"   wp-config.php
sed -i -r "s/user/ss/1"  wp-config.php
sed -i -r "s/pwd/tt/1"    wp-config.php

wp core install --url=aafrikya.42.fr/ --title=RiadElYacoute --admin_user=forstman1 --admin_password=1234 --admin_email=sami.hafid.hs@gmail.com --skip-email --allow-root




wp user create sami1 sahafid@1337.com --role=author --user_pass=123 --allow-root


wp theme install astra --activate --allow-root


wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root


 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php



wp redis enable --allow-root

/usr/sbin/php-fpm7.3 -F