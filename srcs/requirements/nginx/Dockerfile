FROM debian:buster

RUN apt-get update -y; \
	apt-get install -y nginx openssl

COPY /conf/nginx.conf /etc/nginx/

RUN openssl req -x509 -nodes -sha256 -days 365 -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=PT/ST=Porto/L=Porto/O=42Porto/OU=42Porto/CN=www.roramos.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
