#!/bin/bash

cd /var/www
mkdir -p /var/www/html
mkdir -p /var/run/vsftpd/empty

adduser --force-badname $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
adduser $FTP_USER root

/usr/sbin/vsftpd /vsftpd.conf