#!/bin/bash

TAG=latest
NOW=$(date "+%Y.%m.%d %H:%M:%S")

# build image
docker build --rm -t rabbit-mspoc:$TAG --build-arg VERSION=$TAG --build-arg NOW="$NOW" .





