#!/bin/bash

IMAGE_NAME="mishadev/js-benchmark"
CONTAINER_NAME_PREF="js-benchmark"

CONTAINER_NAME_HOSTER="$CONTAINER_NAME_PREF-hoster"
CONTAINER_NAME_TEST_RUNNER="$CONTAINER_NAME_PREF-test-runner"
CONTAINER_NAME_REPORT_BUILDER="$CONTAINER_NAME_PREF-report-builder"

if [ -z $DIR ]; then
  DIR="$( cd "$( dirname `dirname ${BASH_SOURCE[0]}` )" && pwd )"
fi
echo "home dir" $DIR
sudo docker rm -f $CONTAINER_NAME_TEST_RUNNER
sudo docker rm -f $CONTAINER_NAME_REPORT_BUILDER
echo =============================================================
echo runs $CONTAINER_NAME_TEST_RUNNER then runs $CONTAINER_NAME_REPORT_BUILDER image $IMAGE_NAME
echo =============================================================
if [[ ${1} == --framework ]]; then
  ARGS="$@"
  FRAMEWORKS="${@:2}"
  set --
fi

echo "runs benchmark for [${FRAMEWORKS}]"
echo "${CONTAINER_NAME_HOSTER}"

sudo docker run -it \
  --link $CONTAINER_NAME_HOSTER \
  --name $CONTAINER_NAME_TEST_RUNNER \
  $IMAGE_NAME \
  run selenium -- ${ARGS}

sudo docker run -it \
  -v "$DIR/webdriver-ts/results:/src/js-framework-benchmark/webdriver-ts/results" \
  --name $CONTAINER_NAME_REPORT_BUILDER \
  $IMAGE_NAME \
  run results

sudo rm -r $DIR/webdriver-ts/.com.*
