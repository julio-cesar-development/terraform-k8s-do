#!/bin/bash

set $1 --

DO_TOKEN="${1:?"[ERROR] Missing DO Token"}"
export TF_VAR_do_token="$DO_TOKEN"

terraform init
terraform plan
terraform apply -auto-approve
# terraform apply -var="do_token=${DO_TOKEN}" -auto-approve

CLUSTER_NAME="k8s-cluster"

# save kube config with terraform output
terraform output kube_config_raw_config > "${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"
export KUBECONFIG="${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"

# save cluster kube config with doctl
# doctl kubernetes cluster kubeconfig save "${CLUSTER_NAME}"
# it will save the .yaml in the current directory with name [CLUSTER_NAME]-kubeconfig.yaml and set the kubectl to work with this credential

# terraform refresh

# terraform destroy -auto-approve

# set the default kube config
# export KUBECONFIG="${HOME}/.kube/config"
