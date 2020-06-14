resource "kubernetes_namespace" "todoapp-namespace" {
  metadata {
    name = "todoapp"
  }

  depends_on = [digitalocean_kubernetes_cluster.k8s-cluster]
}
