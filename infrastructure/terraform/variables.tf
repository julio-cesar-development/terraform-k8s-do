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

variable "do_node_instance_size" {
  type        = string
  description = "Digital Ocean K8S node size"
  default     = "s-2vcpu-4gb"
}

variable "do_autoscale_options" {
  type        = map
  description = "Digital Ocean auto scale options for K8S nodes"
  default = {
    min_nodes = 1
    max_nodes = 3
  }
}

variable "do_cluster_version" {
  type        = string
  description = "Digital Ocean K8S cluster version"
  default     = "1.18.10-do.2"
}
