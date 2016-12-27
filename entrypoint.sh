#!/bin/bash

if [[ ${1} == --help ]]; then

  echo "run [command]"
  set --
fi
# allow arguments to be passed to npm
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == run ]]; then
  COMMAND="${2}"
  EXTRA_ARGS="$@"
  set --
fi

# default behaviour is to launch npm
if [[ -z ${1} ]]; then
  echo "Starting ${EXTRA_ARGS}..." >&2
  echo "Starting ${COMMAND}" >&2

  if [[ ${COMMAND} = selenium ]]; then
    start-graphical-session
  fi
  echo "npm ${EXTRA_ARGS}"
  npm ${EXTRA_ARGS}

else
  exec "$@"
fi

