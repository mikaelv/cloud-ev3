docker build -t ros-rviz .
#docker-compose up -d master 
docker-compose run --name rviz rviz $1
