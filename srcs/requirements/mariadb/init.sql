CREATE DATABASE wp_db;
CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'dbpw';
GRANT ALL ON wp_db.* TO 'dbuser'@'%' IDENTIFIED BY 'dbpw';