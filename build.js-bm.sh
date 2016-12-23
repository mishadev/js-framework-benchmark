#!/bin/bash

DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
DOCKERFILE="Dockerfile.js-bm"

CONTAINER_NAME="js-bm"
IMAGE_NAME="mishadev/js-bm"

docker rm -f $CONTAINER_NAME
docker rmi -f $IMAGE_NAME
echo =============================================================
echo build image $IMAGE_NAME form file ${DIR}/${DOCKERFILE}
echo =============================================================
docker build -t $IMAGE_NAME --file="${DOCKERFILE}" $DIR
if [[ ${1} != dev ]]; then
  echo "pushing to docker hub"
  docker push $IMAGE_NAME
fi

