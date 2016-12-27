#!/bin/bash

CONTAINER_NAME="js-bm-selenuim"
IMAGE_NAME="mishadev/js-bm"

if [ -z $DIR ]; then
  DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
fi
echo "home dir" $DIR
docker rm -f $CONTAINER_NAME
echo =============================================================
echo run three version of image $IMAGE_NAME
echo =============================================================

#sudo docker run -it \
  #-v "$DIR:/src/js-framework-benchmark" \
  #--link js-bm-web \
  #--name $CONTAINER_NAME \
  #$IMAGE_NAME \
  #run selenium -- --framework knockout react vue

sudo docker run -it \
  -v "$DIR:/src/js-framework-benchmark" \
  --link js-bm-web \
  --name $CONTAINER_NAME \
  $IMAGE_NAME \
  run results -- --framework knockout react vue
