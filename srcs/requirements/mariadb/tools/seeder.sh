#!/bin/sh

service mysql start
if ! [ -d "/var/lib/mysql/$MYSQL_DB_NAME" ]; then
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME ;" > temp.sql;
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' ;" >> temp.sql;
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%' ;" >> temp.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASS' ;" >> temp.sql
	echo "FLUSH PRIVILEGES;" >> temp.sql;

	mysql < temp.sql;
	rm temp.sql;
fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
