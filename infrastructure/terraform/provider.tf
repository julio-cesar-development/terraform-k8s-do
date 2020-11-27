provider "digitalocean" {
  token = var.do_token
}

# AWS get variables from env
provider "aws" {}
