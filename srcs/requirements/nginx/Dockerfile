FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx\
                                            openssl

RUN mkdir -p /etc/nginx/ssl

RUN  openssl req    -x509\
                    -nodes\
                    -out /etc/nginx/ssl/inception.crt\
                    -keyout /etc/nginx/ssl/inception.key\
                    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lletourn.42.fr/UID=lletourn"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]