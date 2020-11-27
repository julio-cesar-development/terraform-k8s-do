
export SOPS_KMS_ARN="arn:aws:kms:sa-east-1::key/"

sops --encrypt environments/application-stage.yaml > application-stage-enc.yaml



ENVIRONMENT=stage
helmfile --environment ${ENVIRONMENT} sync

set -a; . .env; set +a; helmfile sync



terraform plan -var-file=vars.prod.tfvars

export TF_WORKSPACE=production



terraform init
terraform validate

terraform plan
terraform apply -auto-approve



terraform apply -auto-approve -var="todoapp_version=v1.0.0"
# or
export TF_VAR_todoapp_version=v1.0.0
terraform apply -auto-approve



terraform apply -auto-approve --target=module.name


terraform fmt -write=true -recursive

terraform refresh
terraform show
terraform output

terraform destroy -auto-approve


terraform plan -detailed-exitcode


export TF_LOG=TRACE
export TF_LOG_PATH=./terraform.log



export TF_VAR_kubeconfig="$(cd ../../infrastructure/terraform/ && terraform output kube_config_raw_config)"



echo "$TF_VAR_kubeconfig" | tee ./kubeconfig
export KUBECONFIG=./kubeconfig


export TF_VAR_do_token=
export TF_VAR_do_region=nyc1

export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=sa-east-1



terragrunt plan
terragrunt apply
terragrunt output
terragrunt destroy
