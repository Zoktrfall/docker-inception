#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $DB_Name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_User'@'%' IDENTIFIED BY '$DB_Pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_Name.* TO '$DB_User'@'%' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

cd /etc/mysql
echo "[mysqld]" >> my.cnf
echo "lower_case_table_names=1" >> my.cnf

sleep 2
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld