FROM	alpine:latest

RUN apk update
RUN apk add openrc --no-cache
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx

RUN mkdir -p /run/nginx

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Nginx config file and webpage
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# We create SSH user and SSL key
RUN adduser -D admin
RUN echo "admin:admin"|chpasswd

RUN mkdir /admin
RUN chown -R admin:admin /var/lib/nginx
RUN chown -R admin:admin /admin
RUN chown -R admin:admin /www

RUN rm /etc/nginx/conf.d/default.conf
RUN sed -i -e "s/#Port 22/Port 2222/g" /etc/ssh/sshd_config
ADD ./index.html /usr/share/nginx/html/index.html
RUN chmod 666 /usr/share/nginx/html/index.html

RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

RUN ssh-keygen -A

COPY ./ssh-message /etc/motd

RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY start.sh ./start.sh
RUN chmod +x /start.sh
CMD sh ./start.sh
EXPOSE 80
EXPOSE 443
EXPOSE 2222