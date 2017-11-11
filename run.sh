#!/usr/bin/env bash

PORT_HTTP=80
PORT_HTTPS=443

if [[ -z $1 ]]; then
    echo "No port for HTTP specified, using 80."
else
    PORT_HTTP=$1
fi

if [[ -z $2 ]]; then
    echo "No port for HTTPS specified, using 443."
else
    PORT_HTTPS=$2
fi

docker container run \
    -it \
    --rm \
    --detach \
    --name shibboleth-sp \
    --hostname shibboleth-sp \
    -p $PORT_HTTP:80 -p $PORT_HTTPS:443 \
    shibboleth-sp

