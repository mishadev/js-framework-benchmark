#!/bin/bash

IMAGE_NAME="mishadev/js-benchmark"
CONTAINER_NAME_HOSTER="js-benchmark-hoster"

sudo docker rm -f $CONTAINER_NAME_HOSTER
echo =============================================================
echo runs $CONTAINER_NAME_HOSTER image $IMAGE_NAME
echo =============================================================

sudo docker run -it \
  -v "$HOME/report:/src/js-framework-benchmark/webdriver-ts/table" \
  --name $CONTAINER_NAME_HOSTER \
  -p 80:8080 \
  $IMAGE_NAME \
  run host

