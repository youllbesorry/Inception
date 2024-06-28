FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y mariadb-server gettext-base build-essential curl \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copier et exécuter le script d'initialisation
COPY ./init_db.sh /init_db.sh
RUN chmod 777 /init_db.sh

# ENV MYSQL_DATABASE=$MYSQL_DATABASE
# ENV MYSQL_USER=$MYSQL_USER
# ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
# ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
# ENV HOSTNAME=$HOSTNAME

RUN /init_db.sh

EXPOSE 3306


# Définir le point d'entrée
CMD ["mariadbd", "--bind_address=0.0.0.0"]

# ENTRYPOINT ["/init_db.sh"]