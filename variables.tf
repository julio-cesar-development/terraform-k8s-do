# Digital Ocean variables
variable "do_token" {
  type        = string
  description = "Digital Ocean token"
}

variable "do_region" {
  type        = string
  description = "Digital Ocean region"
  default     = "nyc1"
}

variable "do_node_count" {
  type        = number
  description = "Digital Ocean K8S node count"
  default     = 3
}

variable "do_node_size" {
  type        = string
  description = "Digital Ocean K8S node size"
  default     = "s-2vcpu-2gb"
}

# AWS variables
variable "aws_hosted_zone_id" {
  type        = string
  description = "AWS hosted zone ID"
}

# application variables (used by app module)
variable "todoapp_replicas" {
  type        = number
  description = "Number of replicas for todoapp deployment"
  default     = 1
}

variable "todoapp_image_name" {
  type        = string
  description = "Docker image for todoapp deployment"
  default     = "juliocesarmidia/todo-vue"
}

variable "todoapp_image_version" {
  type        = string
  description = "Version of Docker image for todoapp deployment"
  default     = "v2.0.0"
}

variable "todoapp_subdomain" {
  type        = string
  description = "Subdomain of app deployment"
  default     = "ondo.blackdevs.com.br"
}

variable "todoapp_env" {
  type        = string
  description = "Env of app deployment"
  default     = "production"
}
