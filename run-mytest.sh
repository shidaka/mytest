#!/bin/sh

pushd myeureka
. build.sh
popd
pushd myservice
. build.sh
popd
pushd myzuul
. build.sh
popd

cat << EOF > pids
$(docker run \
    -d \
    --name myeureka \
    -e JAVA_OPTS="-DEUREKA_PORT=8761" \
    --rm \
    --cpus 1 \
    --memory 3g \
    myeureka)

$(docker run \
    -d \
    --name myservice1 \
    -e JAVA_OPTS="-DEUREKA_URI=http://myeureka -DAPP_NAME=myservice -DSERVER_PORT=8081 -DEUREKA_PORT=8761" \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 3g \
    myservice)

$(docker run \
    -d \
    --name myservice2 \
    -e JAVA_OPTS="-DEUREKA_URI=http://myeureka -DAPP_NAME=myservice -DSERVER_PORT=8081 -DEUREKA_PORT=8761" \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 3g \
    myservice)

$(docker run \
    -e JAVA_OPTS="-DEUREKA_URI=http://myeureka -DAPP_NAME=myzuul -DSERVER_PORT=8080 -DEUREKA_PORT=8761" \
    -d \
    --name myzuul \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 3g \
    myzuul)
EOF

docker ps
