#!/bin/bash

KUBECONFIG_CONTENT="${KUBECONFIG_CONTENT:?"[ERROR] Missing kubeconfig content"}"
SOPS_KMS_ARN="${SOPS_KMS_ARN:?"[ERROR] Missing sops KMS ARN"}"

AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:?"[ERROR] Missing AWS Access Key"}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:?"[ERROR] Missing AWS Secret Key"}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-"sa-east-1"}"

ENV="${ENV:-"stage"}"
APP_VERSION="${APP_VERSION:-"v1.0.0"}"

echo "[INFO] Deploying application"

# deploy with Terraform container
docker container run \
  --name terraform \
  --net host \
  --rm -it \
  -v "$PWD:/data" \
  -w /data \
  --env TF_VAR_kubeconfig_content="$KUBECONFIG_CONTENT" \
  --env TF_VAR_env="$ENV" \
  --env TF_VAR_app_version="$APP_VERSION" \
  --env SOPS_KMS_ARN \
  --env AWS_ACCESS_KEY_ID \
  --env AWS_SECRET_ACCESS_KEY \
  --env AWS_DEFAULT_REGION \
  --entrypoint "" \
  cloudposse/geodesic:0.133.0 sh -c \
  "cd terraform/ && \
    terraform init -backend=true && \
    terraform validate && \
    terraform plan -out=./plan.tfplan | tee ./plan.txt && \
    terraform apply -auto-approve ./plan.tfplan | tee ./apply.txt"

echo "[INFO] Application deployed successfully"

exit 0
