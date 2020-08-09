#!/bin/bash

# CRD
kubectl apply -f ./jaeger_crd.yaml

# SA and cluter role, cluter role binding
kubectl apply -f ./service_account.yaml
kubectl apply -f ./cluster_role.yaml
kubectl apply -f ./cluster_role_binding.yaml

# Jaeger operator, simplest and ingress
kubectl apply -f ./jaeger.yaml
