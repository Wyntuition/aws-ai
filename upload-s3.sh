#/bin/bash

### USAGE
# upload-s3 <bucket_name> <filename>
set -e

S3_BUCKET=wbv
FILENAME=w1.jpg

echo "ARGS: $#"
if [ $# -ne 0 ]; then
  S3_BUCKET=$1
  FILENAME=$2
fi

echo "BUCKET: $S3_BUCKET"
echo "FILE: $FILENAME"

aws s3 cp $FILENAME s3://$S3_BUCKET/$FILENAME
