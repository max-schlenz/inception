#!/bin/sh

redis-server /etc/redis.conf &
php-fpm7 -F