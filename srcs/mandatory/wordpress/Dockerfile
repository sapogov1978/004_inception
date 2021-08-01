# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/16 22:59:47 by brattles          #+#    #+#              #
#    Updated: 2021/07/28 08:28:32 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install php7.3 php-fpm php-mysql php-curl php-cli php-common mariadb-client && \
	apt-get -y install wget unzip && \
	wget https://wordpress.org/wordpress-5.7.2.zip && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN unzip -q wordpress-5.7.2.zip -d /var/www/ && rm -rf wordpress-5.7.2.zip
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

ARG WORDPRESS_DB_HOST
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

COPY wp-config.php /var/www/wordpress/

RUN sed -i "s/WORDPRESS_DB_NAME/$MYSQL_DATABASE/" /var/www/wordpress/wp-config.php && \
	sed -i "s/WORDPRESS_DB_USER/$MYSQL_USER/" /var/www/wordpress/wp-config.php && \
	sed -i "s/WORDPRESS_DB_PASSWORD/$MYSQL_PASSWORD/" /var/www/wordpress/wp-config.php && \
	sed -i "s/WORDPRESS_DB_HOST/$WORDPRESS_DB_HOST/" /var/www/wordpress/wp-config.php

RUN	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" /etc/php/7.3/fpm/pool.d/www.conf

RUN rm -f /var/www/wordpress/wp-config-sample.php
RUN mkdir -p /var/run/wordpress/ && mkdir -p /var/run/php/

EXPOSE 9000

RUN service php7.3-fpm start

COPY start.sh ./
COPY inception.sql ./ 

ENTRYPOINT [ "sh", "start.sh"]