FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y && apt-get update && apt-get install -y procps

EXPOSE 3306

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/

#COPY conf/auto_run.sh /var/auto_run.sh

COPY ./tools /var/www

RUN service mysql start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

CMD ["mysqld"]
#ENTRYPOINT ["sh", "/var/auto_run.sh"]
