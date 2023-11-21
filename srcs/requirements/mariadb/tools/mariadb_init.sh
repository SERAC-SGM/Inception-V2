#!/bin/sh

echo "\n=============================="
echo "=== Database configuration ==="
echo "==============================\n"

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]
then 
    echo "==> database ${SQL_DATABASE} already exists\n"
else
    echo "starting mariadb..."
    service mariadb start
    sleep 1
    echo "creating database: ${SQL_DATABASE}"
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    sleep 1
    # shutting down mariadb so it can be restarted using exec
    mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
    echo "database ready"
fi
sleep 1
# using exec, the specified command becomes PID 1
# runs the command without a shell. It can have advantages in term of signal handling and clean process termination
exec mysqld