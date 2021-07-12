# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/14 00:10:40 by brattles          #+#    #+#              #
#    Updated: 2021/07/06 00:08:10 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY:	all clean fclean re run_once

SHELL := bash

CONTAINERS := docker ps -a -q
IMAGES := docker images -a -q
NETWORK := docker network ls -q

all:
	docker-compose -f "srcs/docker-compose.yml" --env-file "srcs/.env" up --build

run_once:
	mkdir -p /home/brattles/data
	mkdir -p /home/brattles/data/db
	mkdir -p /home/brattles/data/ws
	echo "127.0.0.1	brattles.42.fr" >> /etc/hosts

clean:
	-docker-compose -f "srcs/docker-compose.yml" down
	-docker stop $$($(CONTAINERS))
	-docker system prune -af --volumes
	-docker rm -f -v $$($(CONTAINERS))

fclean: clean
	-docker network rm $$($(NETWORK))
	-docker rmi -f $$($(IMAGES))
	rm -rf /home/brattles/data/*
	rm -rf /home/brattles/data/

re: fclean all
