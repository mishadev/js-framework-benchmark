#!/bin/bash

CONTAINER_NAME="js-bm"
IMAGE_NAME="mishadev/js-bm"

if [ -z $DIR ]; then
  DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
fi
echo "home dir" $DIR
docker rm -f $CONTAINER_NAME
echo =============================================================
echo run image $IMAGE_NAME container name $CONTAINER_NAME
echo =============================================================
if [[ ${1} == dev ]]; then
  docker run -it \
    -e "DEBUG=true" \
    --name $CONTAINER_NAME \
    -p 80:8080 \
    $IMAGE_NAME \
    --framework knockout react vue --benchmark 01_ 02_
else
  sudo docker run -it \
    --name $CONTAINER_NAME \
    -p 80:8080 \
    -d $IMAGE_NAME \
    --framework knockout react vue --benchmark 01_ 02_
fi

