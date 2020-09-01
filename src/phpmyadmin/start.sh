#!/bin/sh

telegraf &
php -S 0.0.0.0:5000 -t /usr/share/phpmyadmin