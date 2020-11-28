# Terraform K8S provisioner on Digital Ocean

[![Build Status](https://travis-ci.org/julio-cesar-development/terraform-k8s-do.svg)](https://travis-ci.org/julio-cesar-development/terraform-k8s-do)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/terraform-k8s-do)](https://github.com/julio-cesar-development/terraform-k8s-do)
![License](https://badgen.net/badge/license/MIT/blue)

## This project will provide a K8S cluster on Digital Ocean using Terraform and deploy an application

> It uses Travis CI to do the continuous integration and deployment

## Instructions for K8S infrastructure

```bash
export DO_TOKEN="DO_TOKEN"
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="AWS_DEFAULT_REGION"
export SOPS_KMS_ARN="SOPS_KMS_ARN"

bash deploy.sh

unset DO_TOKEN
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_DEFAULT_REGION
unset SOPS_KMS_ARN
```

## Authors

[Julio Cesar](https://github.com/julio-cesar-development)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
