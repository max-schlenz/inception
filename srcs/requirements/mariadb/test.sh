#!/bin/sh

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 &

sleep 3

mariadb -u root << EOF
CREATE DATABASE wp_db;
CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'dbpw';
GRANT ALL ON wp_db.* TO 'dbuser'@'%' IDENTIFIED BY 'dbpw';
EOF

mysqladmin shutdown

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0
