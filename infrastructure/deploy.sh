#!/bin/bash

declare -x CLUSTER_NAME
CLUSTER_NAME="${CLUSTER_NAME:-"k8s-cluster"}"

DO_TOKEN="${DO_TOKEN:?"[ERROR] Missing DO Token"}"

AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:?"[ERROR] Missing AWS Access Key"}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:?"[ERROR] Missing AWS Secret Key"}"
AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION:-"sa-east-1"}"

echo "[INFO] Deploying Infrastructure"

# deploy with Terraform container
docker container run \
  --name terraform \
  --net host \
  --rm -it \
  -v "$PWD:/data" \
  -w /data \
  --env TF_VAR_do_token="$DO_TOKEN" \
  --env CLUSTER_NAME \
  --env AWS_ACCESS_KEY_ID \
  --env AWS_SECRET_ACCESS_KEY \
  --env AWS_DEFAULT_REGION \
  --entrypoint "" \
  cloudposse/geodesic:0.133.0 sh -c \
  "cd terraform/ && \
    terraform init -backend=true && \
    terraform validate && \
    terraform plan -out=./plan.tfplan | tee ./plan.txt && \
    terraform apply -auto-approve ./plan.tfplan | tee ./apply.txt && \
    terraform output kube_config_raw_config > ./${CLUSTER_NAME}-kubeconfig.yaml"

echo "[INFO] Infrastructure deployed successfully"

exit 0
