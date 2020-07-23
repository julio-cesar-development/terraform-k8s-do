#!/bin/bash

export AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-"sa-east-1"}"
export CLUSTER_NAME="${CLUSTER_NAME:-"k8s-cluster"}"

DO_TOKEN="${DO_TOKEN:?"[ERROR] Missing DO Token"}"
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:?"[ERROR] Missing AWS Access Key"}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:?"[ERROR] Missing AWS Secret Key"}"
AWS_HOSTED_ZONE_ID="${AWS_HOSTED_ZONE_ID:?"[ERROR] Missing AWS hosted zone ID"}"

echo "Deploying"

# retrieve certificates from S3
if [ ! -d ./certs/ ] || [ ! -f ./certs/tls.crt ] || [ ! -f ./certs/tls.key ]; then
  mkdir -p ./certs/ && \
  docker container run \
      --name awscli \
      --rm -i \
      -v "$PWD/certs/:/data" \
      -w /data \
      --env AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
      --env AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
      --env AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION" \
      --entrypoint "" \
      amazon/aws-cli:2.0.20 sh -c \
      "aws s3 cp s3://blackdevs-aws/terraform/k8s-do/todoapp.ondo/cert.pem ./tls.crt && \
      aws s3 cp s3://blackdevs-aws/terraform/k8s-do/todoapp.ondo/privkey.pem ./tls.key"
fi

# deploy with Terraform container
docker container run \
  --name terraform \
  --rm -it \
  -v "$PWD:/data" \
  -w /data \
  --env TF_VAR_do_token="$DO_TOKEN" \
  --env TF_VAR_aws_hosted_zone_id="$AWS_HOSTED_ZONE_ID" \
  --env AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  --env AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  --env AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION" \
  --env CLUSTER_NAME="$CLUSTER_NAME" \
  --entrypoint "" \
  hashicorp/terraform:0.12.24 sh -c \
  "apk update && apk add --no-cache curl && \
  terraform init -backend=true && \
  terraform validate && \
  terraform plan -out=./plan.tfplan | tee ./plan.txt && \
  terraform apply -auto-approve ./plan.tfplan | tee ./apply.txt && \
  terraform output kube_config_raw_config > ./${CLUSTER_NAME}-kubeconfig.yaml"

echo "Deployed successful"

exit 0
