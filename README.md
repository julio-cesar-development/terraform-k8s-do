# Terraform K8S provisioner at Digital Ocean

## This project will provide a K8S cluster at Digital Ocean using Terraform

> It uses Travis CI to do the continuous integration and deployment

## Instructions

```bash
export DO_TOKEN="DO_TOKEN"
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY"

chmod +x ./deploy.sh && bash ./deploy.sh
```

## Some Documentation

- https://docs.travis-ci.com/user/job-lifecycle/#the-job-lifecycle
- https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
- https://www.terraform.io/docs/providers/do/r/kubernetes_cluster.html#kubernetes-terraform-provider-example
- https://github.com/terraform-linters/tflint
- https://github.com/liamg/tfsec
- https://github.com/cloudposse/tfmask
- https://github.com/cloudposse/github-commenter
