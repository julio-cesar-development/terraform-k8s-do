terraform {
  backend "s3" {
    key    = "terraform/k8s-do/application/state.tfstate"
    region = "sa-east-1"
    bucket = "blackdevs-aws"
  }
}
