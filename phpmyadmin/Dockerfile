FROM phpmyadmin/phpmyadmin:fpm-alpine

RUN apk update && apk add nginx

COPY nginx.conf /etc/nginx/nginxx.conf
COPY entrypoint /entrypoint

ENTRYPOINT sh /entrypoint
