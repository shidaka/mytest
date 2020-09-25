#!/bin/bash

. build.sh
docker run --rm --name myeureka \
  -e JAVA_OPTS="-DEUREKA_PORT=8761" \
  --cpus 1 --memory 3G \
  myeureka
