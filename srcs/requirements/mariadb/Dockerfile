FROM		debian:buster

RUN			apt-get update && apt-get install procps mariadb-server mariadb-client -y
# RUN			apk add mariadb mariadb-client

RUN			mysql_install_db --user=mysql --ldata=/var/lib/mysql/ \
			&& mkdir /var/run/mysqld \
			&& chown mysql:mysql /var/run/mysqld \
			&& chmod 755 /var/run/mysqld \
			&& mysql_install_db --user=mysql \
			&& chown -R mysql:mysql /var/lib/mysql

COPY		config/* /etc/mysql/mariadb.conf.d/
COPY		entrypoint.sh /entrypoint.sh

# ENTRYPOINT	["/bin/sh"]
ENTRYPOINT	["/entrypoint.sh"]