FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y  mariadb-server

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb_init.sh /usr/local/bin/
RUN chmod +755 /usr/local/bin/mariadb_init.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/usr/local/bin/mariadb_init.sh" ]