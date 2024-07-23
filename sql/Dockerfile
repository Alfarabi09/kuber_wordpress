FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    mysql-server

COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

EXPOSE 3306

# Оставляем контейнер открытым для отладки
# COPY start.sh /usr/local/bin/start.sh
# RUN chmod +x /usr/local/bin/start.sh

CMD service mysql start && tail -F /var/log/mysql/error.log
