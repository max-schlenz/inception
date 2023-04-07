#!/bin/sh

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 &

while ! mysqladmin ping -h localhost --silent; do
  sleep 1
done

echo "MariaDB initialized"
if mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "use $DB_NAME" >/dev/null 2>&1; then
echo "Database already set up"
else
echo "Set up database"
mariadb -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE USER '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_ROOT_USER'@'%';
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
fi
mysqladmin shutdown

while mysqladmin ping -h localhost --silent; do
  sleep 1
done

exec mysqld --user=mysql --skip-networking=0 --bind-address=0.0.0.0 
