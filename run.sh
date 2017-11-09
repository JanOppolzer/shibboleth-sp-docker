#!/usr/bin/env bash

docker container run \
    -it \
    --rm \
    --detach \
    --name shibboleth-sp \
    --hostname shibboleth-sp \
    -p 8080:80 -p 8443:443 \
    shibboleth-sp

