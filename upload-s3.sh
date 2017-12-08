### USAGE
# upload-s3 <bucket_name> <filename>

S3_BUCKET=wbv
FILENAME=w1.jpg

if [ $# -ne 0 ] 
    S3_BUCKET=$1
    FILENAME=$2    
fi

aws s3 cp $FILENAME s3://$S3_BUCKET/$FILENAME