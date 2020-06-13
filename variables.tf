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

variable "do_subdomain" {
  type        = string
  description = "Digital Ocean subdomain"
  default     = "ondo.blackdevs.com.br"
}

# AWS variables
variable "aws_root_zone_id" {
  type        = string
  description = "AWS route53 root zone id"
}

# Application variables
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
