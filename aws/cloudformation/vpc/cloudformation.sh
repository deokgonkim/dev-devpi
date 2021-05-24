#!/bin/bash

aws cloudformation \
deploy \
--template-file cloudformation.yml \
--stack-name vpc \
--capabilities CAPABILITY_NAMED_IAM