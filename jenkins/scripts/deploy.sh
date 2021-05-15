#!/usr/bin/env sh

aws --endpoint-url=http://localhost:4572 s3api put-bucket-acl --bucket test --acl public-read --profile localstack
aws --endpoint-url=http://localhost:4572 s3 sync build/ s3://test --profile localstack
aws --endpoint-url=http://localhost:4572 s3 website s3://test --index-document index.html --profile localstack
aws --endpoint-url=http://localhost:4572 s3 cp s3://test s3://test --exclude "*" --include "*.html" --content-type "text/html" --metadata-directive "REPLACE" --no-guess-mime-type --recursive --acl public-read --profile localstack