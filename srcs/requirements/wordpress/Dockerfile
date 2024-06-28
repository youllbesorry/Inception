# Utiliser une image de base Debian
FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt-get install wget curl php7.4 php-fpm php-mysqli mariadb-client -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar    
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/*

COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY    ./conf/wp-config.sh .
RUN		chmod +x wp-config.sh

# ENTRYPOINT	["./wp-config.sh"]

RUN		./wp-config.sh
# RUN     ./wp-config.php


# Copier le fichier de configuration personnalisé si nécessaire
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# Exposer le port 9000 pour PHP-FPM
# EXPOSE 9000

# Démarrer PHP-FPM en mode premier plan
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]