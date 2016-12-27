#!/bin/bash

CONTAINER_NAME="js-bm"
IMAGE_NAME="mishadev/js-bm"

if [ -z $DIR ]; then
  DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
fi
echo "home dir" $DIR
sudo docker rm -f $CONTAINER_NAME-install
sudo docker rm -f $CONTAINER_NAME-build
sudo docker rm -f $CONTAINER_NAME-web
echo =============================================================
echo run three version of image $IMAGE_NAME
echo =============================================================

sudo docker run -it \
  -v "$DIR:/src/js-framework-benchmark" \
  --name $CONTAINER_NAME-install \
  $IMAGE_NAME \
  run install

sudo docker run -it \
  -v "$DIR:/src/js-framework-benchmark" \
  --name $CONTAINER_NAME-build \
  $IMAGE_NAME \
  run build

sudo docker run -it \
  -v "$DIR:/src/js-framework-benchmark" \
  --name $CONTAINER_NAME-web \
  -p 80:8080 \
  $IMAGE_NAME \
  run web

