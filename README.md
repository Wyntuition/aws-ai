# AWS Rekogition samples

## Analyze photos

1. Upload some photos to an S3 bucket. See the `upload-s3.sh` script for help.

1. Call the Rekognition functions in `/rekognition` to act on the photos (pass in [bucket] [image filename] as parameters on all).

    - `detect-labels.sh` - this detects what's in the photo (objects, person physical attributes)
    - `detect-faces.sh` - OUTPUT: face details; this detects attributes of the face like gender, age, emotion, facial position & attributes

    EXAMPLE:

    `./detect-faces.sh my-bucket my-image.jpg`

1. For more info, see the [Rekognition Docs](https://docs.aws.amazon.com/cli/latest/reference/rekognition/index.html#cli-aws-rekognition).
