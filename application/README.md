# Application deploy

## In order to deploy the application, using terraform, run

```bash
export AWS_ACCESS_KEY_ID="AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="AWS_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="AWS_DEFAULT_REGION"
export SOPS_KMS_ARN="SOPS_KMS_ARN"
export ENV="[stage|prod]"
export APP_VERSION="v1.0.0"
export KUBECONFIG_CONTENT="$(cat ~/.kube/config)"

bash deploy.sh
```
