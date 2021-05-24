#!/bin/bash

export ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com

docker build -t dev/devpi ../../docker

docker tag dev/devpi:latest ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/dev/devpi:latest

docker push ${ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/dev/devpi:latest
