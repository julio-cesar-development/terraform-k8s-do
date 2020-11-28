#!/bin/bash

set -e

declare -x CLUSTER_NAME
CLUSTER_NAME="${CLUSTER_NAME:-"k8s-cluster"}"

declare -x KUBECONFIG
declare -x KUBECONFIG_CONTENT

pushd infrastructure/ && \
  bash deploy.sh

KUBECONFIG="$PWD/terraform/${CLUSTER_NAME}-kubeconfig.yaml"
KUBECONFIG_CONTENT="$(cat "$PWD/terraform/${CLUSTER_NAME}-kubeconfig.yaml")"
popd

sleep 15

pushd application/ && \
  bash deploy.sh
popd

echo "[INFO] Deployed successfully"
