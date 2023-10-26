FROM debian:bullseye

RUN apt-get update -y && apt-get install vsftpd -y

RUN mkdir -p /var/www/html
RUN mkdir -p /var/run/vsftpd/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp_init.sh /usr/local/bin/ftp_init.sh
RUN chmod 755 /usr/local/bin/ftp_init.sh

STOPSIGNAL SIGKILL

ENTRYPOINT [ "/usr/local/bin/ftp_init.sh" ]