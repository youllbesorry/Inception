#!/bin/bash

service mariadb start

# export MYSQL_DATABASE=${MYSQL_DATABASE}
# export MYSQL_USER=${MYSQL_USER}
# export MYSQL_PASSWORD=${MYSQL_PASSWORD}
# export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

echo "${MYSQL_DATABASE} a" >> /tmp/init_db.log
echo "${MYSQL_USER} b" >> /tmp/init_db.log
echo "${MYSQL_PASSWORD} c" >> /tmp/init_db.log
echo "${MYSQL_ROOT_PASSWORD} d" >> /tmp/init_db.log

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; \
                  CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
                  GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost'; \
                  ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; \
                  FLUSH PRIVILEGES;"

service mariadb stop

echo "Database created" >> /tmp/init_db.log