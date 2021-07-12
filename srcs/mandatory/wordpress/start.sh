#!/bin/bash
cp -rf /var/www/data/wordpress/* /var/www/wordpress/
rm -rf /var/www/data

/usr/sbin/php-fpm7.3 -F
#service php7.3-fpm start
