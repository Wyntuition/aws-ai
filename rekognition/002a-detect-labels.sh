#!/bin/bash

#### 
# ARG 1: bucket, ARG 2: file name

if [ $# -eq 0 ] 
    then
        echo "Please provide filename to analyze as an argument"
        exit
fi

aws rekognition detect-labels \
--image '{"S3Object":{"Bucket":"'$1'","Name":"'$2'"}}' \
--region us-east-1 \
