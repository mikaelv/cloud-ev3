docker build -t ros-by-example .
docker-compose up -d  master 
echo Please start ev3_manager on ev3
read -p "Press any key to continue... " -n1 -s
docker-compose up ev3_launch

