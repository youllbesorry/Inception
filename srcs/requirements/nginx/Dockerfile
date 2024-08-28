FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openssl
RUN apt-get install -y nginx

RUN mkdir /etc/nginx/certs

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	    -keyout /etc/nginx/certs/nginx.key -out /etc/nginx/certs/nginx.crt \
	    -subj "/C=FR/L=Lyon/O=42/OU=bfaure/CN=bfaure.42.fr"

COPY conf/nginx.conf /etc/nginx/sites-available/default

# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

