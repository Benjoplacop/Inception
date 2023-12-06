FROM debian:buster


RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y 
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /run/nginx
RUN apt-get update
RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=bhennequ.42.fr/UID=login"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
