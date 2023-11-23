#!/bin/sh


sleep 3

    echo "\n==============================="
    echo "=== Wordpress configuration ==="
    echo "===============================\n"

if [ -f "/var/www/html/wp-config.php" ]
then
    # bypass the 'filesystem not reachable' after reboot without volume removal, no idea why
    usermod -u 33 www-data && groupmod -g 33 www-data
    chown -R www-data:www-data /var/www/html/
    echo "==> wordpress is already installed and configured\n"
else
    # download the wordpress core
    wp core download --allow-root

    # configure the wordpress DB
    wp core config  --allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=$SQL_HOST

    # install wordpress
    wp core install --allow-root\
                    --url=$DOMAIN\
                    --title=$WP_TITLE\
                    --admin_user=$WP_ADMIN\
                    --admin_password=$WP_ADMIN_PASSWORD\
                    --admin_email=$WP_ADMIN_EMAIL

    # create a non-admin user
    wp user create $WP_USER $WP_USER_EMAIL\
                    --role=author\
                    --user_pass=$WP_USER_PASSWORD\
                    --allow-root

    # ensure that the web server has the necessary permissions to read and write to those files
    chown -R www-data:www-data /var/www/html/wp-content
    chown -R www-data:www-data /var/www/html
fi

if [ "$(wp config get WP_CACHE --type=constant --allow-root)" = "true" ]
then
    echo "==> Redis is already configured\n"

else
    echo "\n==========================="
    echo "=== Redis configuration ==="
    echo "===========================\n"

    # configure redis settings in wordpress
    wp config set WP_CACHE true --add --allow-root
    wp config set WP_CACHE_KEY_SALT lletourn.42.fr --allow-root
    wp config set WP_REDIS_HOST redis --allow-root

    # install and activate the redis cache plugin
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root

    # ensure that the web server has the necessary permissions to read and write to those files (otherwise 'filesystem not reachable' warning in wordpress plugin page)
    chown -R www-data:www-data /var/www/html/wp-content/plugins/redis-cache
fi

# run the php process manager in foreground mode
exec /usr/sbin/php-fpm7.4 -F