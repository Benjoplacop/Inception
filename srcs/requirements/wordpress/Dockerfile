FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install wget -y

RUN apt-get install -y php7.3\
			php-fpm\
			php-mysql\
			mariadb-client

COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./conf/auto-config.sh /var/www/wordpress/auto-config.sh

RUN chmod 777 /var/www/wordpress/auto-config.sh

RUN mkdir /run/php/

ENTRYPOINT ["sh","/var/www/wordpress/auto-config.sh" ]
