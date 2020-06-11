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
