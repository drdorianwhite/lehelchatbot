#!/bin/bash
 

if ! [ -x "$(command -v docker)" ]; then
  curl -fsSL get.docker.com -o get-docker.sh
  sh get-docker.sh
  sudo usermod -aG docker $USER
fi


if ! [ -x "$(command -v docker-compose)" ]; then
  sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi


sudo service docker start
cd ./docker_files
docker-compose build && docker-compose up