#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEYOUT_ -out $CERTS_ -subj "/C=AM/L=Yerevan/O=42/OU=student/CN=aafrikya.42.fr"

cd /etc/nginx/sites-available 
cat nginx.conf  > default

sleep 5
nginx -g "daemon off;"