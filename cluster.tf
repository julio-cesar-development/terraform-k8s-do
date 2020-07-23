resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name   = "k8s-cluster"
  region = var.do_region
  # see available versions: doctl kubernetes options versions
  version = "1.17.9-do.0"
  tags    = ["k8s-cluster"]

  # see available sizes: doctl compute size list
  node_pool {
    name       = "node-pool"
    size       = var.do_node_size
    node_count = var.do_node_count
    tags       = ["k8s-cluster-node"]
  }
}
