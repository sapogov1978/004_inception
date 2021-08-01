# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: brattles <brattles@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/14 00:10:40 by brattles          #+#    #+#              #
#    Updated: 2021/07/27 08:03:32 by brattles         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY:	all clean fclean re run_once

CONTAINERS := docker ps -a
IMAGES := docker images -q
NETWORK = mandatory

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

run_once:
	mkdir -p /home/brattles/data
	mkdir -p /home/brattles/data/db
	mkdir -p /home/brattles/data/ws

clean:
	-docker-compose -f ./srcs/docker-compose.yml down --remove-orphans
	-docker stop $$($(CONTAINERS))
	-docker rm -f $$($(CONTAINERS))

fclean: clean
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes
	-docker network rm $$(docker network ls -q)
	-docker rmi -f $$($(IMAGES))
	sudo rm -rf /home/brattles/data

re: fclean all
