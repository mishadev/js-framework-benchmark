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
if [[ ${1} != dev ]]; then
  echo "pushing to docker hub"
  docker build -t --rm --no-cache $IMAGE_NAME --file="${DOCKERFILE}" $DIR
  docker push $IMAGE_NAME
else
  docker build -t $IMAGE_NAME --file="${DOCKERFILE}" $DIR
fi

