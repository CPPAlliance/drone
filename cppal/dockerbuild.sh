#!/bin/bash

# Run this from the top-level directory:
# ./cppal/dockerbuild.sh
#
# And then the push command, also shown below

set -xe

imagename="cppalliance/drone:2024_05_29"

mkdir -p ~/tmp/
if [ -f .dockerignore ]; then
    mv .dockerignore ~/tmp/
fi

docker build --rm -f docker/Dockerfile.server.linux.amd64.cppal -t ${imagename} . 2>&1 | tee /tmp/output.txt

if [ -f ~/tmp/.dockerignore ]; then
    cp ~/tmp/.dockerignore .
fi

# This should be run:
# docker push ${imagename}
