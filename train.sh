#!/bin/bash

python main.py \
    --batch-size 1024 \
    --num-workers 16 \
    --init-lr 1e-2 \
    --momentum 0.9 \
    --epochs 30 \
    --model resnet18 \
    --use-pretrain \
    --multi-gpu

python main.py \
    --batch-size 1024 \
    --num-workers 16 \
    --init-lr 1e-2 \
    --momentum 0.9 \
    --epochs 30 \
    --model se_resnext50_32x4d \
    --use-pretrain \
    --multi-gpu
