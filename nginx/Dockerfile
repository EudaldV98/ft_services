FROM	alpine

RUN	apk update ; \
	apk add nginx ; \
	apk add --no-cache openrc openssl openssh

RUN	mkdir -p var/run/nginx

COPY	index.html /www/

RUN	rm /etc/nginx/nginx.conf
COPY	nginx.conf /etc/nginx/nginx.conf

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/server.key -out /etc/nginx/server.crt -subj "/C=FR/ST=IDE/L=Paris/O=42/OU=42/CN=mywebsite.com" 

RUN	usr/bin/ssh-keygen -A 
COPY	sshd_config /etc/ssh/

COPY	start.sh .
RUN	chmod 775 start.sh

EXPOSE	80 443 2222

CMD	./start.sh