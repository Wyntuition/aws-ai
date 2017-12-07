# A collection to store image metadata for comparison to other images
COLLECTION_ID=wbv-ai1
REGION=us-east-1

aws rekognition create-collection --collection-id $COLLECTION_ID --region $REGION