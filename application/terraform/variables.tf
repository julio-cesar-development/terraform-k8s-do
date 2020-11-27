variable "kubeconfig_content" {
  type        = string
  description = "Kubeconfig content"
}

variable "env" {
  type        = string
  default     = "stage"
  description = "Env"
}

variable "todoapp_node_env" {
  type        = string
  default     = "production"
  description = "Todoapp Node Env"
}

variable "todoapp_version" {
  type        = string
  default     = "latest"
  description = "Todoapp Version"
}
