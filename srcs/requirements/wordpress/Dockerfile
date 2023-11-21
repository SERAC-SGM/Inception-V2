FROM debian:bullseye

RUN apt-get update -y\
    && apt-get install -y   php7.4\
                            php-fpm\
                            php-mysql\
                            mariadb-client\
                            wget

# Bypass 'ERROR: Unable to create the PID file (/run/php/php7.4-fpm.pid).: No such file or directory (2)'
RUN mkdir -p /var/www/html /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wordpress_config.sh /usr/local/bin/wordpress_config.sh
RUN chmod 755 /usr/local/bin/wordpress_config.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "sh", "/usr/local/bin/wordpress_config.sh" ]