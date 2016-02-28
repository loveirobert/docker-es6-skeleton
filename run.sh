#!/bin/bash
# Forwarding port 3000 of the application to the host machine's 3001 looks like this: ./run.sh node-b 3001 3000

if [ -z $1 ]; then
    echo "You must provide service name, host port and container port"
    exit 2
fi

if [ -z $2 ]; then
    echo "You must provide service name, host port and container port"
    exit 2
fi 

if [ -z $3 ]; then
    echo "You must provide service name, host port and container port"
    exit 2
fi

NAME=$1
HOST_PORT=$2
PORT=$3

echo "---> Building the image..."
docker build -t $NAME .
echo "---> Running the container..."
docker rm $NAME
docker run -i -d --name $NAME -p $HOST_PORT:$PORT $NAME
echo "---> Starting the app"
sudo docker exec -d $NAME pm2 start --no-daemon --watch bin/www

