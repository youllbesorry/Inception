FROM debian:bullseye

RUN apt-get update -y \
    && apt-get install -y mariadb-server gettext-base build-essential curl \
    && rm -rf /var/lib/apt/lists/*

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
ARG HOSTNAME
ARG MYSQL_ROOT_USER

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN service mariadb start && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; \
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'; \
    CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%'; \
    FLUSH PRIVILEGES;" && service mariadb restart

EXPOSE 3306

CMD ["mariadbd", "--bind_address=0.0.0.0"]