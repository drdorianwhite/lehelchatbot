#!/bin/bash


#filename: deploy_app.sh
#author: Lehel Kovach
#description:  makes sure docker and docker-compose are installed on host machine, builds the lehelchatbox web service docker image as well as supporting postgresql db server image, and then laucnhes the containers from those images on the running docker daemon on this host machine

echo "checking if docker is installed on local system..."

#if docker not installed, install it
if ! [ -x "$(command -v docker)" ]; then
  echo "docker was not found.  attempting to install docker from online shell scripts through curl..."
  curl -fsSL get.docker.com -o get-docker.sh
  sh get-docker.sh
  echo "IMPROTANT:  adding current user to docker group.  docker daemon will not be able to be started until host machine has loggeed out and back in!"
  sudo usermod -aG docker $USER
  echo "user modified.  attempting to logout.  Log back in with same user; the rest of this shell script will continue execution upon logging in again!"
  cp ./deploy_app.sh ./deploy_app_contd.sh
  sudo chmod a+x ./deploy_app_contd.sh
  echo "sudo rum /etc/profile.d/deploy_app_contd.sh" >> deploy_app_contd.sh
  sudo mv deploy_app_contd.sh /etc/profile.d/
  echo "Logging this user out.  Please log back in to contiue deployment...."
  sudo pkill -u $USER
  exit
fi


echo "checking if docker-compose is already installed..."

#if docker-compose not installed, install it
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "docker-compose not installed.  using curl to run online shell scripts..."
  sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
if


sh ./run-containers.sh

