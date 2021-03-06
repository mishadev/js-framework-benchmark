#!/bin/bash

# allow arguments to be passed to npm
if [[ ${1} == run ]]; then
  COMMAND="${2}"
  EXTRA_ARGS="$@"
  set --
else
  echo "try:"
  echo "run host"
  echo "run benchmark"
fi

# default behaviour is to launch npm
if [[ -z ${1} ]]; then
  echo "Starting ${EXTRA_ARGS}..." >&2
  echo "Starting ${COMMAND}" >&2

  if [[ ${COMMAND} == benchmark ]]; then
    start-graphical-session
  fi

  echo "npm ${EXTRA_ARGS}"
  npm ${EXTRA_ARGS}

else
  exec "$@"
fi

