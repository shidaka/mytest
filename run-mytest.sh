#!/bin/bash

pushd myeureka
. build.sh
popd
pushd myservice
. build.sh
popd
pushd myzuul
. build.sh
popd

# Obs.: 
# --illegal-access=permit (default)
# https://stackoverflow.com/questions/53790182/get-the-current-value-of-illegal-access-setting-in-java
#
# docker logs mostra a seguinte mensagem:
# WARNING: An illegal reflective access operation has occurred
# WARNING: Illegal reflective access by com.thoughtworks.xstream.core.util.Fields (jar:file:/myzuul.jar!/BOOT-INF/lib/xstream-1.4.11.1.jar!/) to field java.util.TreeMap.comparator
# WARNING: Please consider reporting this to the maintainers of com.thoughtworks.xstream.core.util.Fields
# WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
# WARNING: All illegal access operations will be denied in a future release

cat << EOF > pids
$(docker run \
    -d \
    --name myeureka \
    -e JAVA_OPTS="--illegal-access=permit -XX:+PrintFlagsFinal -DEUREKA_PORT=8761" \
    --rm \
    --cpus 1 \
    --memory 3g \
    myeureka)

$(docker run \
    -d \
    --name myservice1 \
    -e JAVA_OPTS="--illegal-access=permit -XX:+PrintFlagsFinal -DEUREKA_URI=http://myeureka -DAPP_NAME=myservice -DSERVER_PORT=8081 -DEUREKA_PORT=8761" \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 132096k \
    myservice)

$(docker run \
    -d \
    --name myservice2 \
    -e JAVA_OPTS="--illegal-access=permit -XX:+PrintFlagsFinal -DEUREKA_URI=http://myeureka -DAPP_NAME=myservice -DSERVER_PORT=8081 -DEUREKA_PORT=8761" \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 132096k \
    myservice)

$(docker run \
    -e JAVA_OPTS="--illegal-access=permit -XX:+PrintFlagsFinal -DEUREKA_URI=http://myeureka -DAPP_NAME=myzuul -DSERVER_PORT=8086 -DEUREKA_PORT=8761" \
    -d \
    --name myzuul \
    --link myeureka \
    --rm \
    --cpus 1 \
    --memory 3g \
    myzuul)
EOF

docker ps

. docker-logs.sh

