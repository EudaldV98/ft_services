FROM	alpine:3.11

RUN	apk update ; \
	apk add wget ; \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session 

RUN	mkdir var/www/ 
RUN	wget https://wordpress.org/latest.tar.gz 
RUN	tar -xvf latest.tar.gz 
RUN	mv wordpress/* /var/www 

COPY	wp-config.php /var/www/wp-config.php

EXPOSE	5050

CMD	php -S 0.0.0.0:5050 -t /var/www/
