FROM debian:bullseye

RUN apt-get update -y && apt-get install -y redis-server php7.4-redis

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT [ "redis-server", "--protected-mode", "no"]