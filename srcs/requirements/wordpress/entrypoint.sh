#!/bin/sh

cd /var/www/html
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1
chmod +x wp-cli.phar > /dev/null 2>&1
./wp-cli.phar config create --dbname="$DB_NAME" --dbuser="$DB_USER" > /dev/null 2>&1
./wp-cli.phar core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ROOT_LOGIN" --admin_password="$WP_ROOT_PASS" --admin_email="$WP_ROOT_MAIL" > /dev/null 2>&1
./wp-cli.phar user create --allow-root "$WP_USER_LOGIN" "$WP_USER_MAIL" --user_pass="$WP_USER_PASS" > /dev/null 2>&1
./wp-cli.phar plugin install redis-cache --activate
./wp-cli.phar config set WP_REDIS_HOST --raw "'redis'"
./wp-cli.phar config set WP_REDIS_SCHEME "unix"
./wp-cli.phar config set WP_CACHE true

php-fpm8 -F