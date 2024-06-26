# Utiliser une image de base Debian
FROM debian:bullseye-slim

RUN	apt update && apt upgrade

RUN apt-get install wget curl -y
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN apt-get install php7.4 php-fpm php-mysqli mariadb-client -y

RUN mkdir -p /run/php/
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/*

# Copier le fichier de configuration personnalisé si nécessaire
# COPY ./wp-config.php /var/www/html/wp-config.php

# Exposer le port 80
EXPOSE 80

# Démarrer Apache en mode premier plan
CMD		["/usr/sbin/php-fpm7.4", "--nodaemonize"]