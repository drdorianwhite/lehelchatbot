sudo service docker start
cd ./docker_files
docker-compose build && docker-compose up

sudo rm /etc/profile.d/run-containers-on-login.sh
