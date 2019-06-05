#!/bin/bash

# usage: sh docker/build.sh
sudo nvidia-docker build \
     --build-arg UID=`id -u` --build-arg USERNAME=`whoami` \
     -t ${USER}/mlflow -f docker/Dockerfile .
