#!/bin/bash

sudo nvidia-docker run --rm -it \
     --shm-size 4G \
     -v `pwd`:/work \
     -p 8005:8888 \
     --name ${USER}.mlflow ${USER}/mlflow