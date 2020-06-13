# Terraform K8S provisioner at Digital Ocean

[![Build Status](https://travis-ci.org/julio-cesar-development/terraform-k8s-do.svg)](https://travis-ci.org/julio-cesar-development/terraform-k8s-do)
![License](https://badgen.net/badge/license/MIT/blue)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/terraform-k8s-do)](https://github.com/julio-cesar-development/terraform-k8s-do)

## This project will provide a K8S cluster at Digital Ocean using Terraform and deploy an application

> It uses Travis CI to do the continuous integration and deployment

## Instructions

```bash
export DO_TOKEN="DO_TOKEN"
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY"
export AWS_ROOT_ZONE_ID="AWS_ROOT_ZONE_ID"

chmod +x ./deploy.sh && bash ./deploy.sh
```

## Authors

[Julio Cesar](https://github.com/julio-cesar-development)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
