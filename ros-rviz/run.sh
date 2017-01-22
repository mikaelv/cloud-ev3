docker build -t ros-rviz .
#docker-compose up -d master 
docker-compose run --rm --name rviz rviz $1
