resource "digitalocean_kubernetes_cluster" "k8s-cluster" {
  name   = "k8s-cluster"
  region = var.do_region
  # see available versions: doctl kubernetes options versions
  version      = var.do_cluster_version
  auto_upgrade = false
  vpc_uuid     = digitalocean_vpc.main-vpc.id
  tags         = ["k8s-cluster"]

  # see available sizes: doctl compute size list
  node_pool {
    name       = "k8s-cluster-node-pool"
    size       = var.do_node_instance_size
    auto_scale = true
    min_nodes  = lookup(var.do_autoscale_options, "min_nodes")
    max_nodes  = lookup(var.do_autoscale_options, "max_nodes")
    tags       = ["k8s-cluster-node-pool"]
  }

  depends_on = [digitalocean_vpc.main-vpc]
}
