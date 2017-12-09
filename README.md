# AWS Rekogition samples

## Create an AWS account
Create IAM role with permissions to read/write to the following:
1. 3 bucket
1. face detection api (may take up to 24 hrs

## Analyze photos

1. Upload some photos to an S3 bucket. See the `upload-s3.sh` script for help.

1. Call the Rekognition fucntions in `/rekognition` to act on the photos ((pass in [bucket] [image filename] as parameters) on all).

    - `detect-labels.sh` - this detects what's in the photo (objects, person physical attributes)
    - `detect-faces.sh` - OUTPUT: face details; this detects attributes of the face like gender, age, emotion, facial position & attributes

    EXAMPLE:

    `./detect-faces.sh my-bucket my-image.jpg [us-west-2]`

1. For more info, see the [Rekognition Docs](https://docs.aws.amazon.com/cli/latest/reference/rekognition/index.html#cli-aws-rekognition).

## InvalidS3ObjectException
1. The rekognition api does not support bucket names with `.` in them
1. Even though s3 is region agnostic, the rekognition api is *not*, ensure that you have specified the appropriate region to the scripts (default region is `us-east-1`)
