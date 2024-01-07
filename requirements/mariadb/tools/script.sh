#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS MyDB ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'ZoktrFall'@'%' IDENTIFIED BY 'Xxx123' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON MyDB.* TO 'ZoktrFall'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

sleep 1
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld