#!/bin/bash
set -eu

source configs/config
source bin/usage.sh

create() {
  aws s3api create-bucket --bucket "$SOURCE_BUCKET" --region us-east-1
}

delete() {
  for key in $(aws s3api list-objects --bucket "$SOURCE_BUCKET" --no-paginate --query Contents[].Key)
      aws s3api delete-object --bucket "$SOURCE_BUCKET" --key key
}


main "$@"
