terraform {
  required_version = "~> 0.12.0"

  backend "s3" {
    bucket = "blackdevs-aws"
    key    = "terraform/k8s-do/state.tfstate"
    region = "sa-east-1"
  }
}

module "todoapp" {
  source = "./modules/todoapp"

  # AWS variables
  aws_hosted_zone_id = var.aws_hosted_zone_id

  # application variables
  todoapp_replicas      = var.todoapp_replicas
  todoapp_image_name    = var.todoapp_image_name
  todoapp_image_version = var.todoapp_image_version
  todoapp_subdomain     = var.todoapp_subdomain
  todoapp_env           = var.todoapp_env

  # kube config variable
  kube_config_raw_config = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.raw_config

  # depends on variable
  var_depends_on = [digitalocean_kubernetes_cluster.k8s-cluster]
}
