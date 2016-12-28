#!/bin/bash

IMAGE_NAME="mishadev/js-benchmark"
CONTAINER_NAME_HOSTER="js-benchmark-hoster"

if [ -z $DIR ]; then
  DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
fi
echo "home dir" $DIR
sudo docker rm -f $CONTAINER_NAME_HOSTER
echo =============================================================
echo runs $CONTAINER_NAME_HOSTER image $IMAGE_NAME
echo =============================================================

sudo docker run -it \
  -v "$DIR/webdriver-ts/results:/src/js-framework-benchmark/webdriver-ts/results" \
  --name $CONTAINER_NAME_HOSTER \
  -p 80:8080 \
  $IMAGE_NAME \
  run web

