#!/bin/bash

# set "$1" --

DO_TOKEN="${DO_TOKEN:?"[ERROR] Missing DO Token"}"
# export TF_VAR_do_token="$DO_TOKEN"

docker run --name terraform --rm \
  -v "$PWD:/data" -it \
  -e TF_VAR_do_token="$DO_TOKEN" \
  --entrypoint "" \
  hashicorp/terraform:0.12.24 sh -c \
  "cd /data && terraform init && terraform plan -out=./plan.tfplan 1> ./plan.txt 2>&1 && terraform apply -auto-approve ./plan.tfplan 1> ./apply.txt"

# terraform init
# terraform plan -detailed-exitcode -out=./plan.tfplan 1> ./plan.txt 2>&1
# cat ./plan.txt | tfmask | github-commenter

# terraform apply -auto-approve ./plan.tfplan 1> ./apply.txt 2>&1
# cat ./apply.txt | tfmask | github-commenter
# terraform apply -var="do_token=${DO_TOKEN}" -auto-approve

# CLUSTER_NAME="k8s-cluster"

# save kube config with terraform output
# terraform output kube_config_raw_config > "${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"
# export KUBECONFIG="${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"

# save cluster kube config with doctl
# doctl kubernetes cluster kubeconfig save "${CLUSTER_NAME}"
# it will save the .yaml in the current directory with name [CLUSTER_NAME]-kubeconfig.yaml and set the kubectl to work with this credential

# terraform refresh

# terraform destroy -auto-approve
# rm -rf .terraform/ plan.txt plan.tfplan apply.txt terraform.tfstate

# set the default kube config
# export KUBECONFIG="${HOME}/.kube/config"
