resource "digitalocean_vpc" "main-vpc" {
  name     = "main-vpc"
  region   = var.do_region
  ip_range = "10.0.0.0/24"
}
