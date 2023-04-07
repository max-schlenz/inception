#!/bin/sh

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 &

sleep 6

env


mariadb -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_ROOT_USER'@'%';
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown
sleep 6

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0
