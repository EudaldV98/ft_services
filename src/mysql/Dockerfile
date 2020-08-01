FROM		alpine:3.11

RUN 		apk update ; \
		apk add mariadb mariadb-client && apk add --no-cache --upgrade bash ; \
		rm -rf /var/cache/apk/*

COPY		start.sh .
COPY		init_db.sh .
COPY		mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY		my.cnf /etc/my.cnf
COPY		wordpress.sql .
RUN 		chmod 777 start.sh
RUN 		chmod 777 init_db.sh

EXPOSE		3306

CMD		./start.sh