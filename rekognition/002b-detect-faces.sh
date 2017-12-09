#!/bin/bash

set -e

### USAGE
# detact-faces <bucket_name>, <filename>
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

REGION="us-east1"
if [ ! -z "$3" ]; then
  REGION=$3
fi

aws rekognition detect-faces \
  --image '{"S3Object":{"Bucket":"'$1'","Name":"'$2'"}}' \
  --region $REGION \
  --attributes ALL
