FROM debian:bullseye

RUN apt-get update -y && apt-get install -y php-fpm php-mysqli php7.4-mysql curl

# RUN adduser -G www-data www-data

# RUN mkdir -p /var/www/wordpress
# RUN mv /usr/share/adminer /var/www/wordpress/.
# RUN chown www-data:www-data /var/www/wordpress/adminer

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php
RUN	usermod -u 82 www-data
RUN usermod -a -G www-data www-data

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir -p /run/php/

EXPOSE 9000
STOPSIGNAL SIGQUIT


ENTRYPOINT [ "php-fpm7.4", "--nodaemonize" ]
