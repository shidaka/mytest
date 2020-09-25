#!/bin/sh

# CONTAINERS=$(docker ps -q)
CONTAINERS=$(cat pids)

for c in $CONTAINERS; {
    echo "Removing container $c..."
    docker container rm -f $c
}
docker container ls
rm -f pids