#!/bin/bash

export CLUSTER_NAME="${CLUSTER_NAME:-"k8s-cluster"}"

DO_TOKEN="${DO_TOKEN:?"[ERROR] Missing DO Token"}"
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:?"[ERROR] Missing AWS Access Key"}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:?"[ERROR] Missing AWS Secret Key"}"

echo "Deploying"

docker container run --name terraform --rm \
  -v "$PWD:/data" -it \
  -e TF_VAR_do_token="$DO_TOKEN" \
  -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  -e AWS_DEFAULT_REGION="$AWS_DEFAULT_REGION" \
  -e CLUSTER_NAME="$CLUSTER_NAME" \
  --entrypoint "" \
  hashicorp/terraform:0.12.24 sh -c \
  "cd /data && terraform init -backend=true && terraform validate && \
  terraform plan -out=./plan.tfplan 1> ./plan.txt 2>&1 && \
  terraform apply -auto-approve ./plan.tfplan 1> ./apply.txt && \
  terraform output kube_config_raw_config > ./${CLUSTER_NAME}-kubeconfig.yaml"

echo "Deployed successful"

exit 0

# CLUSTER_NAME="k8s-cluster"

# save kube config with terraform output
# terraform output kube_config_raw_config > "${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"
# export KUBECONFIG="${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"

# save cluster kube config with doctl
# doctl kubernetes cluster kubeconfig save "${CLUSTER_NAME}"
# it will save the .yaml in the current directory with name [CLUSTER_NAME]-kubeconfig.yaml and set the kubectl to work with this credential

# terraform destroy -auto-approve
# rm -rf .terraform/ plan.* apply.txt terraform.tfstate*

# set the default kube config
# export KUBECONFIG="${HOME}/.kube/config"
