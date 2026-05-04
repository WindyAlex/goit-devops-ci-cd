#!/usr/bin/env bash
set -euo pipefail

: "${TF_BACKEND_BUCKET:?Set TF_BACKEND_BUCKET}"
: "${TF_BACKEND_DYNAMODB_TABLE:?Set TF_BACKEND_DYNAMODB_TABLE}"
AWS_REGION="${AWS_REGION:-eu-north-1}"

if ! aws s3api head-bucket --bucket "$TF_BACKEND_BUCKET" 2>/dev/null; then
  if [ "$AWS_REGION" = "us-east-1" ]; then
    aws s3api create-bucket --bucket "$TF_BACKEND_BUCKET" --region "$AWS_REGION"
  else
    aws s3api create-bucket --bucket "$TF_BACKEND_BUCKET" --region "$AWS_REGION" --create-bucket-configuration LocationConstraint="$AWS_REGION"
  fi
fi

aws s3api put-bucket-versioning --bucket "$TF_BACKEND_BUCKET" --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket "$TF_BACKEND_BUCKET" --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
aws s3api put-public-access-block --bucket "$TF_BACKEND_BUCKET" --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

if ! aws dynamodb describe-table --table-name "$TF_BACKEND_DYNAMODB_TABLE" --region "$AWS_REGION" >/dev/null 2>&1; then
  aws dynamodb create-table \
    --table-name "$TF_BACKEND_DYNAMODB_TABLE" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region "$AWS_REGION"
  aws dynamodb wait table-exists --table-name "$TF_BACKEND_DYNAMODB_TABLE" --region "$AWS_REGION"
fi
