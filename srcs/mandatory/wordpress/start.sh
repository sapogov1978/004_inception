#!/bin/bash

wp core install --url="brattles.42.fr" --path="/var/www/wordpress" --title="BRATTLES::INCEPTION" --admin_user="subject_usr1" --admin_password="usr1" --admin_email="usr1@brattles.42.fr" --allow-root --quiet

wp db import inception.sql --path="var/www/wordpress" --allow-root --quiet

php-fpm7.3 --nodaemonize
