FROM debian:bullseye

RUN apt-get update -y && apt-get install -y redis-server php7.4-redis

COPY conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

# run the redis server with the protected mode disabled (restricts connections to localhost)
ENTRYPOINT [ "redis-server", "--protected-mode", "no"]