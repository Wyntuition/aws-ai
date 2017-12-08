#!/bin/bash

### USAGE
# detact-faces <bucket_name>, <filename>

if [ $# -eq 0 ] 
    then
        echo "Please provide bucket & filename to analyze as an argument"
        exit
fi

aws rekognition detect-faces \
--image '{"S3Object":{"Bucket":"'$1'","Name":"'$2'"}}' \
--region us-east-1 \
--attributes ALL