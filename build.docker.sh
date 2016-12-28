#!/bin/bash

DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
DOCKERFILE="Dockerfile.js-benchmark"

CONTAINER_NAME_PREF="js-benchmark"
IMAGE_NAME="mishadev/js-benchmark"

sudo docker rm -f $(sudo docker ps -a | grep $CONTAINER_NAME_PREF | cut -c-12)
sudo docker rmi -f $IMAGE_NAME
echo =============================================================
echo build image $IMAGE_NAME form file ${DIR}/${DOCKERFILE}
echo =============================================================
echo "building docker image"
if [[ ${1} != dev ]]; then
  echo "will PUSH when ready"
  sudo docker build -t $IMAGE_NAME --rm --no-cache --file="${DOCKERFILE}" $DIR

  echo "pushing to docker hub"
  sudo docker push $IMAGE_NAME
else
  sudo docker build -t $IMAGE_NAME --rm --file="${DOCKERFILE}" $DIR
fi

