FROM debian:buster


RUN apt-get update && apt-get install -y apt-utils  nginx openssl && apt-get upgrade -y
RUN mkdir -p /etc/nginx/ssl /run/nginx /var/run/nginx /var/www/html /var/www/wordpress && chmod 700 /etc/nginx/ssl && chown -R www-data:www-data /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=bhennequ.42.fr/UID=bhennequ"
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
