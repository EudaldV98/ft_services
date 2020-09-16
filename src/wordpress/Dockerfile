FROM alpine:latest

# Install Wordpress and dependencies
RUN apk update \
	&& apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mkdir /www \
	&& mv wordpress/ www/

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

ADD ./start.sh 			./start.sh
RUN chmod 755 /start.sh

EXPOSE 5050

CMD ["sh", "./start.sh"]