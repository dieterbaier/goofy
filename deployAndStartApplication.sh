#!/usr/bin/env bash

echo "Building actual version..."
mvn clean install

echo "stopping actual docker container to start a new one..."
CONTAINER_NAME="goofy_runtime"
IMAGE_NAME="brdietdidi/goofy"
OLD="$(docker ps --all --quiet --filter=name="$CONTAINER_NAME")"
if [ -n "$OLD" ]; then
  docker stop $OLD && docker rm $OLD
fi


echo "build and start the new docker container..."
docker build -t $IMAGE_NAME . && docker run -d -p 8080:8080 -p 9990:9990 --name $CONTAINER_NAME $IMAGE_NAME