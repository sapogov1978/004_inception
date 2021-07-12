# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/02 19:27:36 by brattles          #+#    #+#              #
#    Updated: 2021/07/07 21:23:56 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y --no-install-suggests install mariadb-server

VOLUME ["/var/lib/mysql"]

COPY my.cnf /etc/my.cnf
COPY start.sh /

RUN mkdir -p /var/run/mariadb/
CMD sh start.sh