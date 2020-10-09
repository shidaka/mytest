#!/bin/bash

#. build.sh
docker run --name myservice --link myeureka \
  --cpus 1 --memory 128M \
  -e JAVA_OPTS="-DEUREKA_URI=http://myeureka -DAPP_NAME=myservice -DSERVER_PORT=8081 -DEUREKA_PORT=8761" myservice
