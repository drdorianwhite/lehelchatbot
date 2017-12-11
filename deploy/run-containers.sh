echo "starting docker daemon service via sudo..."
sudo service docker start
echo "building web and db server images using docker-compose.yml config..."
cd ./docker_files
docker-compose build
echo "starting posgtres server container..."
docker-compose run posgtres
echo "starting lehelchatbot pheonix app..."
docker-compose run webapp

