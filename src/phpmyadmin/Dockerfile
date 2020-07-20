FROM	alpine:3.11

RUN	apk update && apk upgrade ; \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz ; \
	tar xvf phpMyAdmin-4.9.5-all-languages.tar.gz ; \
	rm phpMyAdmin-4.9.5-all-languages.tar.gz ; \
	mv phpMyAdmin-4.9.5-all-languages /www

COPY	phpmyadmin.inc.php /www/config.inc.php

EXPOSE	5000

CMD	php -S 0.0.0.0:5000 -t /www/