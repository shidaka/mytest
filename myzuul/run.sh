#!/bin/bash

. build.sh
docker run --rm --name myzuul --link myeureka \
  --cpus 1 --memory 3G \
  -e JAVA_OPTS="-DEUREKA_URI=http://myeureka -DAPP_NAME=myzuul -DSERVER_PORT=8086 -DEUREKA_PORT=8761" myzuul
