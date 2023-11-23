#!/bin/sh

echo "\n================================"
echo "=== FTP server configuration ==="
echo "================================\n"

# add a new user for FTP access (disabled password to avoid prompt)
adduser $FTP_USER --disabled-password --gecos "$FTP_USER,42,42,42,ftp user"

# set the user password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

chown -R $FTP_USER:$FTP_USER /var/www/html
chmod 777 /var/www/html

# append the FTP user to the FTP userlist
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &> /dev/null

# start the  FTP server using the configuration file specified
/usr/sbin/vsftpd /etc/vsftpd.conf