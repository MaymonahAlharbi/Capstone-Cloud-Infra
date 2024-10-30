#!/bin/sh

sudo apt-get update -yy
sudo apt-get install -yy git curl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

git clone https://github.com/MaymonahAlharbi/Capstone-1.git
cd Capstone-1

echo "REDIS_HOST=${redis_host}" > .env
echo "DB_HOST=${db_host}" >> .env
echo "DB_USER=user" >> .env
echo "DB_PASSWORD=password" >> .env
echo "DB_NAME=mydatabase" >> .env
echo "MYSQL_ROOT_PASSWORD=rootpassword" >> .env


until nc -vzw 2 ${db_host} 3306; do
    echo "Waiting for MySQL database to be ready..."
    sleep 30
done

docker compose up -d web
