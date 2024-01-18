#!bin/bash

mkdir -p /var/www/html
wget https://www.adminer.org/latest.php -O adminer.php
mv adminer.php /var/www/html/index.php

php -S 0.0.0.0:8080 -t /var/www/html