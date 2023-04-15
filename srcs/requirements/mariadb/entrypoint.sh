#!/bin/sh

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 &

while ! mysqladmin ping -h localhost --silent; do
  sleep 1
done

mariadb -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE DATABASE IF NOT EXISTS $GITEA_DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_ROOT_USER'@'%';
GRANT ALL PRIVILEGES ON $GITEA_DB_NAME.* TO '$MYSQL_ROOT_USER'@'%';
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
GRANT ALL PRIVILEGES ON $GITEA_DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown

while mysqladmin ping -h localhost --silent; do
  sleep 1
done

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 