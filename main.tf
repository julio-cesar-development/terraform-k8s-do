terraform {
  required_version = "~> 0.12.0"
}

resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name    = "k8s-cluster"
  region  = "nyc1"
  version = "1.16.8-do.0"
  tags    = ["staging"]

  # see available sizes: doctl compute size list
  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-2gb"
    node_count = 3
  }
}

provider "kubernetes" {
  load_config_file = false
  host  = digitalocean_kubernetes_cluster.k8s-cluster.endpoint
  token = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.cluster_ca_certificate
  )
}
