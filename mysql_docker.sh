#!/bin/bash
# Install Docker
sudo apt update -y
sudo apt install -y docker.io
sudo docker run -itd -e MYSQL_ROOT_PASSWORD=${db_root_pwd} -e MYSQL_DATABASE=${db_name} -e MYSQL_USER=${db_user} -e MYSQL_PASSWORD=${db_user_pwd} -v wordpressdb:/var/lib/mysql -p 3306:3306 -d mysql:latest
