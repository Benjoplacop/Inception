sleep 10

cd /var/www/wordpress/

if [ ! -e wp-config.php ]; then

wp config create	--allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install		--url=$WP_URL \
			--title=$WP_TITLE \
			--admin_user=$WP_ADMIN_LOGIN \
			--admin_password=$WP_ADMIN_PASSWORD \
			--admin_email=$WP_ADMIN_EMAIL \
			--allow-root --path='/var/www/wordpress'

sleep 10

wp user create		$WP_USER_LOGIN $WP_USER_EMAIL \
			--allow-root \
			--role=author \
			--user_pass=$WP_USER_PASSWORD \
			--path='/var/www/wordpress'
fi

/usr/sbin/php-fpm7.3 -F
