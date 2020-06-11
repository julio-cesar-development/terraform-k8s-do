# Terraform K8S provisioner at Digital Ocean

[![Build Status](https://travis-ci.org/julio-cesar-development/terraform-k8s-do.svg)](https://travis-ci.org/julio-cesar-development/terraform-k8s-do)
![License](https://badgen.net/badge/license/MIT/blue)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/terraform-k8s-do)](https://github.com/julio-cesar-development/terraform-k8s-do)

## This project will provide a K8S cluster at Digital Ocean using Terraform

> It uses Travis CI to do the continuous integration and deployment

## Instructions

```bash
export DO_TOKEN="DO_TOKEN"
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY"

chmod +x ./deploy.sh && bash ./deploy.sh
```

## Some documentation

- https://docs.travis-ci.com/user/job-lifecycle/#the-job-lifecycle
- https://docs.travis-ci.com/user/environment-variables/#default-environment-variables
- https://www.terraform.io/docs/providers/do/r/kubernetes_cluster.html#kubernetes-terraform-provider-example
- https://github.com/terraform-linters/tflint
- https://github.com/liamg/tfsec
- https://github.com/cloudposse/tfmask
- https://github.com/cloudposse/github-commenter

## Authors

[Julio Cesar](https://github.com/julio-cesar-development)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
