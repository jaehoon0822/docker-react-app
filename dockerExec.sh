#!/bin/bash

mode=$1
exec=$2

readonly prod="dockerComposes/docker-compose-prod.yml"

readonly dev="dockerComposes/docker-compose-dev.yml"

if [ $mode = "prod" ]; then
  if [ $exec = "build" ]; then
    docker compose -f ${prod} ${exec} --no-cache
  elif [ $exec = "up" ]; then
    docker compose -f ${prod} ${exec} -d
  else
    echo 0
  fi
else
  if [ $exec = "build" ]; then
    docker compose -f ${dev} ${exec} --no-cache
  elif [ $exec = "up" ]; then
    docker compose -f ${dev} ${exec} -d
  else
    echo 0
  fi
fi
