# AWS variables
variable "aws_hosted_zone_id" {
  type        = string
  description = "AWS route53 root zone id"
}

# application variables
variable "todoapp_replicas" {
  type        = number
  description = "Number of replicas for app deployment"
  default     = 1
}

variable "todoapp_image_name" {
  type        = string
  description = "Docker image for app deployment"
  default     = "juliocesarmidia/todo-vue"
}

variable "todoapp_image_version" {
  type        = string
  description = "Version of Docker image for app deployment"
  default     = "v2.0.0"
}

variable "todoapp_domain" {
  type        = string
  description = "Domain of app deployment"
  default     = "blackdevs.com.br"
}

variable "todoapp_env" {
  type        = string
  description = "Env of app deployment"
  default     = "production"
}

# kube config variable
variable "kube_config_raw_config" {
  type        = any
  description = "Kube config content to be used as config file"
}

# depends on variable
variable "var_depends_on" {
  type        = any
  description = "Variable to be used as dependency"
  default     = null
}
