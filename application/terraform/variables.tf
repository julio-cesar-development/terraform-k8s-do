variable "kubeconfig_content" {
  type        = string
  description = "Kubeconfig Content"
}

variable "env" {
  type        = string
  default     = "stage"
  description = "Env"
}

variable "app_version" {
  type        = string
  default     = "latest"
  description = "Version"
}
