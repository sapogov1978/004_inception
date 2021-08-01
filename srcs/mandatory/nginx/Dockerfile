# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/16 22:57:49 by brattles          #+#    #+#              #
#    Updated: 2021/07/27 07:19:05 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install nginx && \
	apt-get -y install openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -sha256 -out /etc/nginx/ssl/local.pem -keyout /etc/nginx/ssl/local.key -subj "/C=RU/ST=NSO/L=Moscow/O=21school/CN=localhost/emailAddress=brattles@student.21school.ru"

COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/run/nginx/ && \
	mkdir -p /var/www/wordpress

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
