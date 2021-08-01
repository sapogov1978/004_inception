# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/02 19:27:36 by brattles          #+#    #+#              #
#    Updated: 2021/07/28 08:49:35 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install mariadb-server

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_DATABASE

RUN service mysql start && \
	mysqladmin -u root password ${MYSQL_ROOT_PASSWORD} && \
	echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -u root -p${MYSQL_ROOT_PASSWORD} && \
	echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root -p${MYSQL_ROOT_PASSWORD} && \
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root -p${MYSQL_ROOT_PASSWORD} && \
	echo "FLUSH PRIVILEGES;" | mysql -u root -p${MYSQL_ROOT_PASSWORD}

RUN	sed -i "s/\#port/port/" "/etc/mysql/mariadb.conf.d/50-server.cnf" && \
    sed -i "s/bind-address/\#bind-address/" "/etc/mysql/mariadb.conf.d/50-server.cnf"

EXPOSE 3306
ENTRYPOINT ["mysqld"]
