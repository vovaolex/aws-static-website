
#!/bin/bash
set -e

BUCKET="vova-aws-static-website-2026"
DISTRIBUTION_ID="E2KT9D9K8WEAT4"
PROFILE="aws-devops"

echo "Uploading website to S3..."

aws s3 sync . "s3://$BUCKET" \
  --exclude ".git/*" \
  --exclude ".DS_Store" \
  --exclude "deploy.sh" \
  --exclude "README.md" \
  --profile "$PROFILE"

echo "Invalidating CloudFront cache..."

aws cloudfront create-invalidation \
  --distribution-id "$DISTRIBUTION_ID" \
  --paths "/*" \
  --profile "$PROFILE"

echo "Deployment initiated successfully!"
