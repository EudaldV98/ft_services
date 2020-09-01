#!/bin/sh

NAME=user
PASS=password
FOLDER="/ftp/user"

echo -e "$PASS\n$PASS" | adduser -h $FOLDER -s /sbin/nologin -u 1000 $NAME

mkdir -p $FOLDER
chown $NAME:$NAME $FOLDER
unset NAME PASS FOLDER UID

ADDR=$(cat ip)

telegraf &
exec /usr/sbin/vsftpd -opasv_address=$ADDR /etc/vsftpd/vsftpd.conf