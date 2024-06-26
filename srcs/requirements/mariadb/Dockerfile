FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y mariadb-server gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d && touch /docker-entrypoint-initdb.d/init.sql

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copier le fichier init.sql depuis le répertoire local
ARG MYSQL_ROOT_PASSWORD

COPY ./init.sql /docker-entrypoint-initdb.d/

RUN service mariadb start && envsubst < /docker-entrypoint-initdb.d/init.sql | mysql -u root -p${MYSQL_ROOT_PASSWORD}

# Configurer MariaDB pour écouter sur toutes les interfaces
RUN sed -i 's/^bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Exposer le port 3306
EXPOSE 3306

# Définir le point d'entrée
CMD ["mariadbd", "--bind_address=0.0.0.0"]