#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS mydb ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'ZoktrFall'@'%' IDENTIFIED BY 'Xxx123' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON mydb.* TO 'ZoktrFall'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

cd /etc/mysql
echo "[mysqld]" >> my.cnf
echo "lower_case_table_names=1" >> my.cnf

sleep 2
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld