FROM alpine:latest

RUN apk update \
	&& apk add mysql mysql-client

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

ADD ./init_db.sh .
ADD ./my.cnf /etc/

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "./init_db.sh"]