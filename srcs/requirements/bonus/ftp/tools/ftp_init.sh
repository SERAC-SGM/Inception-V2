#!/bin/sh

echo "\n================================"
echo "=== FTP server configuration ==="
echo "================================\n"

adduser $FTP_USER --disabled-password --gecos "$FTP_USER,42,42,42,ftp user"

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

chown -R $FTP_USER:$FTP_USER /var/www/html

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist &> /dev/null

/usr/sbin/vsftpd /etc/vsftpd.conf