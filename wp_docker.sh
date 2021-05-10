#!/bin/bash
# Install Docker
sudo apt update -y 
sudo apt install -y docker.io
sudo docker run -itd -e WORDPRESS_DB_HOST=${db_ip} -e WORDPRESS_DB_USER=${db_user} -e WORDPRESS_DB_PASSWORD=${db_user_pwd} -e WORDPRESS_DB_NAME=${db_name} -v wp_site:/var/www/html -p 80:80 -d wordpress
