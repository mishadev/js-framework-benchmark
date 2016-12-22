#!/bin/bash

# allow arguments to be passed to npm
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == node ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

git checkout master && git add -A && git reset --hard && git pull

# default behaviour is to launch npm
if [[ -z ${1} ]]; then
  echo "Starting tests..." >&2
  start-graphical-session

  echo "npm run selenium -- ${EXTRA_ARGS}"

  npm run selenium -- ${EXTRA_ARGS}
else
  exec "$@"
fi

