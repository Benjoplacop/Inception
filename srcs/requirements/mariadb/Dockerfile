FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get update && apt-get install -y procps
RUN apt-get install mariadb-server -y mariadb-client -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/init.sh /var/init.sh
#RUN chmod 777 /var/init.sh

ENTRYPOINT ["sh", "/var/init.sh"]
