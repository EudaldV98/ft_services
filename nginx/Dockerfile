FROM    nginx:alpine
MAINTAINER  JEudald Vaquer (jvaquer@student.42.fr)

RUN apk add --update openssh

COPY    entrypoint /entrypoint

ENTRYPOINT  sh  /entrypoint

EXPOSE  443 80 22
