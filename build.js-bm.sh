#!/bin/bash

DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
DOCKERFILE="Dockerfile.js-bm"

CONTAINER_NAME="js-bm"
IMAGE_NAME="mishadev/js-bm"

sudo docker rm -f $(docker ps -a | grep $CONTAINER_NAME | cut -c-12)
sudo docker rmi -f $IMAGE_NAME
echo =============================================================
echo build image $IMAGE_NAME form file ${DIR}/${DOCKERFILE}
echo =============================================================
if [[ ${1} != dev ]]; then
  echo "pushing to docker hub"
  sudo docker build -t $IMAGE_NAME --rm --no-cache --file="${DOCKERFILE}" $DIR
  sudo docker push $IMAGE_NAME
else
  sudo docker build -t $IMAGE_NAME --rm --file="${DOCKERFILE}" $DIR
fi

