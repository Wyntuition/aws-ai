#!/bin/bash

######
# ARG 1: bucket, ARG 2: file name, ARG 3: region (optional, default us-east-1)

usage() {
  echo "ERROR: $1"
  echo ""
  echo "USAGE: $0 bucket file [region]"
  echo "region defaults to 'us-east-1'"
}

if [ $# -eq 0 ]; then
  usage "Required arguments missing"
  exit 1
fi

REGION="us-east-1"
if [ ! -z $3 ]; then
  REGION=$3
fi

aws rekognition detect-labels \
--image '{"S3Object":{"Bucket":"'$1'","Name":"'$2'"}}' \
--region $REGION \
