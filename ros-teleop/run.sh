docker-compose up -d master echo 
docker logs echo -f &
docker-compose run --rm --name teleop teleop
