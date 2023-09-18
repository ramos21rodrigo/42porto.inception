FROM debian:buster

RUN apt-get update && apt-get upgrade -y; \
    apt-get install -y mariadb-server;

COPY ./tools /tmp/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /tmp/seeder.sh

ENTRYPOINT ["sh", "-c", "/tmp/seeder.sh;"]
