resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name   = "k8s-cluster"
  region = var.do_region
  # see available versions: doctl kubernetes options versions
  version = var.do_cluster_version
  tags    = ["k8s-cluster"]

  # see available sizes: doctl compute size list
  node_pool {
    name       = "k8s-cluster-node-pool"
    size       = var.do_node_instance_size
    node_count = var.do_node_instance_count
    tags       = ["k8s-cluster-node-pool"]
  }
}

resource "digitalocean_kubernetes_node_pool" "k8s-cluster-autoscale-node-pool" {
  cluster_id = digitalocean_kubernetes_cluster.k8s-cluster.id
  name       = "autoscale-pool-01"
  size       = var.do_node_instance_size
  auto_scale = true
  min_nodes  = lookup(var.do_autoscale_options, "min_nodes")
  max_nodes  = lookup(var.do_autoscale_options, "max_nodes")

  tags = ["k8s-cluster-autoscale-node-pool"]
}
