## Some documentation

- https://docs.travis-ci.com/user/job-lifecycle/#the-job-lifecycle
- https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
- https://www.terraform.io/docs/providers/do/r/kubernetes_cluster.html#kubernetes-terraform-provider-example
- https://github.com/terraform-linters/tflint
- https://github.com/liamg/tfsec
- https://github.com/cloudposse/tfmask
- https://github.com/cloudposse/github-commenter

## Some commands

```bash
CLUSTER_NAME="k8s-cluster"

# save kube config with terraform output
terraform output kube_config_raw_config > "${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"
export KUBECONFIG="${PWD}/${CLUSTER_NAME}-kubeconfig.yaml"

# save cluster kube config with doctl
doctl kubernetes cluster kubeconfig save "${CLUSTER_NAME}"
# it will save the .yaml in the current directory with name [CLUSTER_NAME]-kubeconfig.yaml and
# set the kubectl to work with this credential

# set the default kube config
export KUBECONFIG="${HOME}/.kube/config"
```
