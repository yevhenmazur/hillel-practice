#!/bin/sh

docker build --build-arg REFRESHED_AT=$(date --rfc-3339='date') --build-arg UID=1001 --build-arg GID=1024 -t yevhenmazur/hugo:0.122.0-1 ./
