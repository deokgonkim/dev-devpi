#!/bin/bash

export REPOSITORY_NAME=dev/devpi

aws ecr \
create-repository \
--repository-name $REPOSITORY_NAME
