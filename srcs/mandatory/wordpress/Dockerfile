# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/16 22:59:47 by brattles          #+#    #+#              #
#    Updated: 2021/07/06 07:41:03 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install php7.3 php7.3-fpm  php7.3-mysqli php7.3-xml php7.3-curl php7.3-ctype && \
	apt-get -y --no-install-suggests install wget && \
	wget -c -t inf --no-check-certificate https://wordpress.org/wordpress-5.7.2.tar.gz -O wordpress.tar.gz

RUN mkdir -p /var/www/data/wordpress && tar -xvf wordpress.tar.gz --strip-components 1 -C /var/www/data/wordpress
RUN rm -rf wordpress.tar.gz

COPY wp-config.php /var/www/data/wordpress/
COPY www.conf /etc/php/7.3/fpm/php-fpm.d/
COPY ./start.sh /

RUN chmod 777 start.sh
RUN mkdir -p /var/run/
RUN mkdir -p /var/run/wordpress/
RUN service php7.3-fpm start
CMD ["sh", "start.sh"]	
