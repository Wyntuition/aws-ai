#!/bin/bash
set -e

usage() {
  if [ ! -z "$1" ]; then
    echo "ERROR: $1"
    echo ""
  fi

  echo "USAGE: $0 bucket [--directory] [--excludes] [--preserve]"
  echo "directory defaults to '.'"
  echo "excludes is a list of extensions to ignore, i.e. '*.mp3'"
  echo "preserve indicates whether the directory structure should be preserved in s3, defaults to 'false'"
}

if [ -z "$1" ]; then
  usage "Missing bucket name"
  exit 1
fi

BUCKET="$1"
shift

EXCLUDE=""
DIR="."
S3URL="s3://$BUCKET"
PRESERVE=0

while [ $# -ne 0 ]; do
  case "$1" in
    --help | h)
      usage
      exit 0
      ;;

    --directory | -d)
      DIR="$2"
      shift
      ;;

    --excludes)
      EXCLUDE="$2"
      shift
      ;;

    --preserve)
      PRESERVE=1
      shift
      ;;

    *)
      shift
      ;;
  esac
done

if [[ "$DIR" != "." && "$PRESERVE" == "1" ]]; then
  S3URL="s3://$BUCKET/$DIR"
fi

FILES="$(find "$DIR" -type f)"
for FILE in $FILES; do
  FILENAME="${FILE##*/}"
  aws s3 cp "$FILE" "$S3URL/$FILENAME"
done
