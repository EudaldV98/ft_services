
FROM alpine:latest

RUN apk update \
	&& apk upgrade \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add openssh \
	&& apk add vim

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN adduser -D admin
RUN echo "admin:admin" | chpasswd

RUN rm /etc/nginx/conf.d/default.conf
ADD ./default.conf /etc/nginx/conf.d/default.conf
RUN sed -i -e "s/#Port 22/Port 2222/g" /etc/ssh/sshd_config
RUN mkdir /run/nginx
RUN mkdir -p /usr/share/nginx/html
ADD ./index.html /usr/share/nginx/html/index.html
RUN chmod 666 /usr/share/nginx/html/index.html

RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

RUN ssh-keygen -A

COPY ./ssh-message /etc/motd
COPY ./start.sh /start.sh
RUN	 chmod +x ./start.sh
RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443 2222

CMD ["/start.sh"]